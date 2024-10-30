import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Location?> getLocationFromAddress({
    required String address,
  }) async {
    final result = await locationFromAddress(address);

    return result.isNotEmpty ? result.first : null;
  }
}
