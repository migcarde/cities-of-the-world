import 'package:core/core.dart';
import 'package:data/network/client.dart';
import 'package:data/network/interceptors/response_interceptor.dart';
import 'package:data/remote/cities_remote_datasource.dart';
import 'package:data/remote/cities_remote_datasource_impl.dart';
import 'package:data/remote/client/cities_client.dart';

class DataDi {
  static void init() {
    // Remote
    getIt.registerLazySingleton(() {
      final client = Client();

      client.configureInterceptors(
        [
          ResponseInterceptor(),
        ],
      );

      return client.dio;
    });

    getIt.registerLazySingleton(
      () => CitiesClient(
        getIt(),
        baseUrl: 'https://connect-demo.mobile1.io/square1/connect/',
      ),
    );

    getIt.registerLazySingleton<CitiesRemoteDatasource>(
      () => CitiesRemoteDatasourceImpl(
        client: getIt(),
      ),
    );
  }
}
