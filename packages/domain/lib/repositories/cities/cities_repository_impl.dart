import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/cities/cities_repository.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesRemoteDatasource citiesRemoteDatasource;
  final CitiesLocalDatasource citiesLocalDatasource;
  final LocationService locationService;

  const CitiesRepositoryImpl({
    required this.citiesRemoteDatasource,
    required this.citiesLocalDatasource,
    required this.locationService,
  });

  @override
  Future<Result<PageEntity>> getCities({
    int? page,
    String? include,
    String? name,
  }) async {
    try {
      PageEntity? localResult;
      final citiesFromLocalResult = await getCitiesFromLocal(
        search: name,
        page: page,
      );

      citiesFromLocalResult.ifSuccess((page) {
        localResult = page;
      });

      if (localResult != null) {
        return Result.success(localResult!);
      }

      final response = await citiesRemoteDatasource.getCities(
        page: page,
        include: include,
        name: name,
      );

      final result =
          await getEntitiesWithCoordinates(pageRemoteEntity: response.data!);

      saveCities(
        search: name ?? '',
        page: result,
      );

      return Result.success(result);
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> saveCities({
    required String search,
    required PageEntity page,
  }) async {
    try {
      await citiesLocalDatasource.saveCities(
        page.localEntity(
          search: search,
        ),
      );

      return Result.success(null);
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }

  @override
  Future<Result<PageEntity?>> getCitiesFromLocal({
    String? search,
    int? page,
  }) async {
    try {
      final result = await citiesLocalDatasource.getCities(
        search: search,
        page: page,
      );

      return Result.success(result?.entity);
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }

  Future<PageEntity> getEntitiesWithCoordinates({
    required PageRemoteEntity pageRemoteEntity,
  }) async {
    final List<CityRemoteEntity> items = pageRemoteEntity.items ?? [];
    List<CityEntity> updatedCities = [];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];

      LocationEntity? location = await locationService.getLocationFromAddress(
        address: item.name ?? '',
      );

      location ??= await locationService.getLocationFromAddress(
        address: item.localName ?? '',
      );

      updatedCities.add(
        item.entity.copyWith(
          latitude: location?.latitude,
          longitude: location?.longitude,
        ),
      );
    }

    return pageRemoteEntity.entity.copyWith(
      items: updatedCities,
    );
  }
}
