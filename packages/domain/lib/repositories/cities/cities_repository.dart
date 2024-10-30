import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';

abstract class CitiesRepository {
  Future<Result<BaseResponseEntity>> getCities({
    int? page,
    String? include,
    String? name,
  });
}
