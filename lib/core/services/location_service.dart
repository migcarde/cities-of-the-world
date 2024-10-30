import 'package:core/core.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Location?> getLocationFromAddress({
    required String address,
  }) async {
    try {
      final result = await locationFromAddress(address);

      return result.isNotEmpty ? result.first : null;
    } on Exception catch (e) {
      logger.error(e);

      return null;
    }
  }
}
