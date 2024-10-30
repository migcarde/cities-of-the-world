import 'package:core/core.dart';
import 'package:geocoding/geocoding.dart';

class LocationServiceImpl implements LocationService {
  @override
  Future<LocationEntity?> getLocationFromAddress({
    required String address,
  }) async {
    try {
      final result = await locationFromAddress(address);

      return result.isNotEmpty
          ? LocationEntity(
              latitude: result.first.latitude,
              longitude: result.first.longitude,
            )
          : null;
    } on Exception catch (e) {
      logger.error(e);

      return null;
    }
  }
}
