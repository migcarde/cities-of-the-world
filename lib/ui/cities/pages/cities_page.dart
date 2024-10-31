import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:cities_of_the_world/ui/cities/pages/cities_mobile_layout.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

  static const _inputPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CitiesCubit>(
      create: (context) => getIt<CitiesCubit>()..init(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(_inputPadding),
            child: TextFormField(
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a city'),
              onFieldSubmitted: (city) => getIt<CitiesCubit>().searchByCity(
                city: city,
              ),
            ),
          ),
          const CitiesMobileLayout(),
        ],
      ),
    );
  }
}
