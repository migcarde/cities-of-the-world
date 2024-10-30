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

    final result = await _getCities();

    result.when(
      success: (response) => _onSuccessInit(
        cities: response.data?.items ?? [],
        lastPage: response.data?.pagination?.lastPage ?? 1,
      ),
      failure: (_) => _onFailure(),
    );
  }

  Future<void> getNextPage() async {
    final result = await _getCities(
      page: state.currentPage + 1,
      city: state.currentSearch.isNotEmpty ? state.currentSearch : null,
    );

    result.when(
      success: (response) => _onSuccessUpdate(
        cities: response.data?.items ?? [],
        lastPage: response.data?.pagination?.lastPage ?? 1,
      ),
      failure: (_) => _onFailure(),
    );
  }

  Future<void> searchByCity({
    required String city,
  }) async {
    emit(
      state.copyWith(
        status: CitiesStatus.loading,
        currentSearch: city,
      ),
    );

    final result = await _getCities(
      city: city.isNotEmpty ? city : null,
    );

    result.when(
      success: (response) => _onSuccessSearch(
        cities: response.data?.items ?? [],
        lastPage: response.data?.pagination?.lastPage ?? 1,
      ),
      failure: (_) => _onFailure(),
    );
  }

  void _onSuccessInit({
    required List<CityEntity> cities,
    required int lastPage,
  }) =>
      emit(
        state.copyWith(
          status: CitiesStatus.data,
          cities: cities.map((city) => city.viewModel).toList(),
          currentPage: 1,
          lastPage: lastPage,
        ),
      );

  void _onSuccessUpdate({
    required List<CityEntity> cities,
    required int lastPage,
  }) =>
      emit(
        state.copyWith(
          status: CitiesStatus.data,
          cities: [
            ...state.cities,
            ...cities.map((city) => city.viewModel),
          ],
          currentPage: state.currentPage + 1,
          lastPage: lastPage,
        ),
      );

  void _onSuccessSearch({
    required List<CityEntity> cities,
    required int lastPage,
  }) =>
      emit(
        state.copyWith(
          status: CitiesStatus.data,
          cities: cities.map((city) => city.viewModel).toList(),
          currentPage: 1,
          lastPage: lastPage,
        ),
      );

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
