import 'package:cities_of_the_world/core/di/cubits_di.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

class CitiesOfTheWorldDi {
  static Future<void> init() async {
    DomainDi.init();
    CubitsDi.init();

    await getIt.allReady();
  }
}
