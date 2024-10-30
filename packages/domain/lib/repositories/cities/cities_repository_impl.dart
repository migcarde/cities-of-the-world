import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/base/result.dart';
import 'package:domain/models/page_entity.dart';
import 'package:domain/repositories/cities/cities_repository.dart';
import 'package:domain/models/base_response_entity.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesRemoteDatasource citiesRemoteDatasource;
  final CitiesLocalDatasource citiesLocalDatasource;

  const CitiesRepositoryImpl({
    required this.citiesRemoteDatasource,
    required this.citiesLocalDatasource,
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

      final result = await citiesRemoteDatasource.getCities(
        page: page,
        include: include,
        name: name,
      );

      return Result.success(result.entity.data!);
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
}
