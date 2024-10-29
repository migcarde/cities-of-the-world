import 'package:data/remote/entities/base_response_remote_entity.dart';

abstract class CitiesRemoteDatasource {
  Future<BaseResponseRemoteEntity> getCities({
    int? page,
    String? include,
    String? name,
  });
}
