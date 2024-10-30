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
      success: (response) async => await _onSuccessInit(
        page: response,
        lastPage: response.pagination?.lastPage ?? 1,
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
      success: (response) async => await _onSuccessUpdate(
        page: response,
        lastPage: response.pagination?.lastPage ?? 1,
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
      success: (response) async => await _onSuccessSearch(
        page: response,
        lastPage: response.pagination?.lastPage ?? 1,
      ),
      failure: (_) => _onFailure(),
    );
  }

  Future<void> _onSuccessInit({
    required PageEntity page,
    required int lastPage,
  }) async =>
      emit(
        state.copyWith(
          status: page.items.isEmpty ? CitiesStatus.empty : CitiesStatus.data,
          cities: page.items.map((item) => item.viewModel).toList(),
          currentPage: 1,
          lastPage: lastPage,
        ),
      );

  Future<void> _onSuccessUpdate({
    required PageEntity page,
    required int lastPage,
  }) async =>
      emit(
        state.copyWith(
          cities: [
            ...state.cities,
            ...page.items.map((item) => item.viewModel),
          ],
          currentPage: state.currentPage + 1,
          lastPage: lastPage,
        ),
      );

  Future<void> _onSuccessSearch({
    required PageEntity page,
    required int lastPage,
  }) async =>
      emit(
        state.copyWith(
          status: page.items.isEmpty ? CitiesStatus.empty : CitiesStatus.data,
          cities: page.items.map((item) => item.viewModel).toList(),
          currentPage: 1,
          lastPage: lastPage,
        ),
      );

  void _onFailure() => emit(
        state.copyWith(
          status: CitiesStatus.error,
        ),
      );

  Future<Result<PageEntity>> _getCities({
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
