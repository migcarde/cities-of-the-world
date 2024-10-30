import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:core/core.dart';

class CubitsDi {
  static void init() {
    getIt.registerLazySingleton(
      () => CitiesCubit(
        getCities: getIt(),
      ),
    );
  }
}
