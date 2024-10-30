import 'package:flutter/widgets.dart';

class CityListItem extends StatelessWidget {
  const CityListItem(
      {super.key,
      required this.city,
      required this.country,
      this.latitude,
      this.longitude});

  final String city;
  final String country;
  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(city),
        Text(country),
        if (latitude != null) Text('$latitude'),
        if (longitude != null) Text('$longitude'),
      ],
    );
  }
}
