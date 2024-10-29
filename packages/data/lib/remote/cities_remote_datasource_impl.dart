import 'package:data/remote/cities_remote_datasource.dart';
import 'package:data/remote/client/cities_client.dart';
import 'package:data/remote/entities/base_response.dart';

class CitiesRemoteDatasourceImpl implements CitiesRemoteDatasource {
  final CitiesClient client;

  const CitiesRemoteDatasourceImpl({
    required this.client,
  });

  @override
  Future<BaseResponse> getCities({
    int? page,
    String? include,
    String? name,
  }) async {
    final result = await client.getCities(
      page: page,
      include: include,
      name: name,
    );

    return result;
  }
}
