import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/cities/cities_repository.dart';
import 'package:domain/repositories/cities/cities_repository_impl.dart';

class DomainDi {
  static void init() {
    DataDi.init();

    // Repositories
    getIt.registerFactory<CitiesRepository>(
      () => CitiesRepositoryImpl(
        citiesRemoteDatasource: getIt(),
      ),
    );

    // Operations
    getIt.registerFactory(
      () => GetCities(
        citiesRepository: getIt(),
      ),
    );
  }
}
