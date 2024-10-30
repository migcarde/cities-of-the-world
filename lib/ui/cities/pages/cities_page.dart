import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:cities_of_the_world/ui/cities/pages/cities_mobile_layout.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CitiesCubit>(
      create: (context) => getIt<CitiesCubit>()..init(),
      child: BlocBuilder<CitiesCubit, CitiesState>(
        builder: (context, state) {
          switch (state.status) {
            case CitiesStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CitiesStatus.data:
              return CitiesMobileLayout(cities: state.cities);
            case CitiesStatus.error:
              return const Center(
                child:
                    Text('Ooops, something was wrong, please, try again later'),
              );
          }
        },
      ),
    );
  }
}
