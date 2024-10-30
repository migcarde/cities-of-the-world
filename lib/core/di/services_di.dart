import 'package:cities_of_the_world/core/services/location_service.dart';
import 'package:core/core.dart';

class ServicesDi {
  static void init() {
    getIt.registerLazySingleton(
      () => LocationService(),
    );
  }
}
