import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';

abstract class CitiesRepository {
  Future<Result<PageEntity>> getCities({
    int? page,
    String? include,
    String? name,
  });

  Future<Result<void>> saveCities({
    required String search,
    required PageEntity page,
  });

  Future<Result<PageEntity?>> getCitiesFromLocal({
    required String search,
    required int page,
  });
}
