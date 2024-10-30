import 'package:cities_of_the_world/ui/cities/widgets/not_available_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CityListItem extends StatelessWidget {
  const CityListItem({
    super.key,
    required this.city,
    required this.country,
    this.latitude,
    this.longitude,
  });

  final String city;
  final String country;
  final double? latitude;
  final double? longitude;

  static const _containerPadding = 18.0;

  @override
  Widget build(BuildContext context) {
    final hasLocation = latitude != null && longitude != null;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(
        _containerPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color:
              hasLocation ? theme.colorScheme.primary : theme.colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(
          24.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!hasLocation) const NotAvailableChip(),
          Text(
            city,
            style: theme.textTheme.titleMedium,
          ),
          Text(country),
        ],
      ),
    );
  }
}
