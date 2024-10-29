import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/base/result.dart';
import 'package:domain/cities_repository.dart';
import 'package:domain/models/base_response_entity.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesRemoteDatasource citiesRemoteDatasource;

  const CitiesRepositoryImpl({
    required this.citiesRemoteDatasource,
  });

  @override
  Future<Result<BaseResponseEntity>> getCities({
    int? page,
    String? include,
    String? name,
  }) async {
    try {
      final result = await citiesRemoteDatasource.getCities(
        page: page,
        include: include,
        name: name,
      );

      return Result.success(result.entity);
    } catch (e) {
      logger.error(e);

      return Result.failure(e);
    }
  }
}
