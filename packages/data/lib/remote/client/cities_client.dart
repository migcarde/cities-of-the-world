import 'package:data/remote/entities/base_response_remote_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'cities_client.g.dart';

@RestApi()
abstract class CitiesClient {
  factory CitiesClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _CitiesClient;

  @GET('v1/city')
  Future<BaseResponseRemoteEntity> getCities({
    @Query('page') int? page,
    @Query('include') String? include,
    @Query('filter[0][name][contains]') String? name,
  });
}
