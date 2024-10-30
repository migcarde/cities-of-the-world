import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:cities_of_the_world/ui/cities/pages/cities_mobile_layout.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({super.key});

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      length: 2,
      vsync: this,
    );
    return BlocProvider<CitiesCubit>(
      create: (context) => getIt<CitiesCubit>()..init(),
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (city) => getIt<CitiesCubit>().searchByCity(
              city: city,
            ),
          ),
          BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) {
              switch (state.status) {
                case CitiesStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case CitiesStatus.data:
                  return CitiesMobileLayout(
                    tabController: tabController,
                    cities: state.cities,
                    isLastPage: state.currentPage >= state.lastPage,
                    getNextPage: () =>
                        context.read<CitiesCubit>().getNextPage(),
                  );
                case CitiesStatus.error:
                  return const Center(
                    child: Text(
                        'Ooops, something was wrong, please, try again later'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
