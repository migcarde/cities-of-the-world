import 'package:bloc/bloc.dart';
import 'package:cities_of_the_world/core/services/location_service.dart';
import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:core/core.dart';
import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';
import 'package:geocoding/geocoding.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final GetCities getCities;
  final LocationService locationService;

  CitiesCubit({
    required this.getCities,
    required this.locationService,
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
        cities: response.items,
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
        cities: response.items,
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
        cities: response.items,
        lastPage: response.pagination?.lastPage ?? 1,
      ),
      failure: (_) => _onFailure(),
    );
  }

  Future<void> _onSuccessInit({
    required List<CityEntity> cities,
    required int lastPage,
  }) async =>
      emit(
        state.copyWith(
          status: cities.isEmpty ? CitiesStatus.empty : CitiesStatus.data,
          cities: await _getCitiesAndCoordinates(
            cities: cities,
          ),
          currentPage: 1,
          lastPage: lastPage,
        ),
      );

  Future<void> _onSuccessUpdate({
    required List<CityEntity> cities,
    required int lastPage,
  }) async {
    final citiesToAdd = await _getCitiesAndCoordinates(
      cities: cities,
    );

    emit(
      state.copyWith(
        status: cities.isEmpty ? CitiesStatus.empty : CitiesStatus.data,
        cities: [
          ...state.cities,
          ...citiesToAdd,
        ],
        currentPage: state.currentPage + 1,
        lastPage: lastPage,
      ),
    );
  }

  Future<void> _onSuccessSearch({
    required List<CityEntity> cities,
    required int lastPage,
  }) async =>
      emit(
        state.copyWith(
          status: cities.isEmpty ? CitiesStatus.empty : CitiesStatus.data,
          cities: await _getCitiesAndCoordinates(
            cities: cities,
          ),
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

  Future<Location?> _getLocation({required String name}) async {
    final result = await locationService.getLocationFromAddress(
      address: name,
    );

    return result;
  }

  Future<List<CityViewModel>> _getCitiesAndCoordinates({
    required List<CityEntity> cities,
  }) async {
    List<CityViewModel> result = [];

    for (var i = 0; i < cities.length; i++) {
      final city = cities[i];
      final location = await _getLocation(name: city.name);

      result.add(
        city.viewModel(
          latitude: location?.latitude,
          longitude: location?.longitude,
        ),
      );
    }

    return result;
  }
}
