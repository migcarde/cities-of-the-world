import 'dart:async';

import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CitiesMap extends StatefulWidget {
  const CitiesMap({
    super.key,
    required this.cities,
  });

  final List<CityViewModel> cities;

  @override
  State<CitiesMap> createState() => _CitiesMapState();
}

class _CitiesMapState extends State<CitiesMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final markers = getMarkers();

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: markers.first.position,
      ),
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Set<Marker> getMarkers() {
    Set<Marker> result = {};
    for (var i = 0; i < widget.cities.length; i++) {
      final city = widget.cities[i];

      if (city.hasLatitudeAndLongitude) {
        final marker = Marker(
          markerId: MarkerId(city.name),
          position: LatLng(
            city.latitude!,
            city.longitude!,
          ),
        );

        result.add(marker);
      }
    }

    return result;
  }
}
