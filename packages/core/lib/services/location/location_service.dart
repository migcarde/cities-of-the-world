import 'package:core/services/services.dart';

abstract class LocationService {
  Future<LocationEntity?> getLocationFromAddress({
    required String address,
  });
}
