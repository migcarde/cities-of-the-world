import 'package:data/remote/entities/base_response.dart';

abstract class CitiesRemoteDatasource {
  Future<BaseResponse> getCities({
    int? page,
    String? include,
    String? name,
  });
}
