import 'package:flutter/widgets.dart';

class CityListItem extends StatelessWidget {
  const CityListItem({
    super.key,
    required this.city,
    required this.location,
    required this.country,
  });

  final String city;
  final String location;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(city),
        Text(location),
        Text(country),
      ],
    );
  }
}
