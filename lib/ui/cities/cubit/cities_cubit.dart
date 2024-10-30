import 'package:bloc/bloc.dart';
import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:core/core.dart';
import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final GetCities getCities;

  CitiesCubit({
    required this.getCities,
  }) : super(const CitiesState());

  Future<void> init() async {
    emit(
      state.copyWith(
        status: CitiesStatus.loading,
      ),
    );

    final result = await _getCities(city: 'a', page: 3);

    result.when(
      success: (response) => _onSuccess(
        cities: response.data?.items ?? [],
      ),
      failure: (_) => _onFailure(),
    );
  }

  void _onSuccess({required List<CityEntity> cities}) {
    emit(
      state.copyWith(
        status: CitiesStatus.data,
        cities: cities.map((city) => city.viewModel).toList(),
      ),
    );
  }

  void _onFailure() => emit(
        state.copyWith(
          status: CitiesStatus.error,
        ),
      );

  Future<Result<BaseResponseEntity>> _getCities({
    String? city,
    int? page,
  }) async =>
      getCities(
        GetCitiesParams(
          include: 'country',
          page: page,
          name: city,
        ),
      );
}
