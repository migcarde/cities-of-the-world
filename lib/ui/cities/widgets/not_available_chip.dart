import 'package:flutter/material.dart';

class NotAvailableChip extends StatelessWidget {
  const NotAvailableChip({super.key});

  static const _containerPaddingHorizontal = 8.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _containerPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.error,
        borderRadius: BorderRadius.circular(
          100.0,
        ),
      ),
      child: Text(
        'Not available on map',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
