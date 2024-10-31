import 'package:flutter/material.dart';

class CityDetailsDialog extends StatelessWidget {
  const CityDetailsDialog({
    super.key,
    required this.parentContext,
    required this.city,
    required this.country,
  });

  final BuildContext parentContext;
  final String city;
  final String country;

  static const _containerBorder = 24.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(parentContext);

    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            _containerBorder,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              city,
              style: theme.textTheme.titleMedium,
            ),
            Text(country),
          ],
        ),
      ),
    );
  }
}
