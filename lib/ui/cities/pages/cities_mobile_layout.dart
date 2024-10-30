import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:cities_of_the_world/ui/cities/widgets/cities_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesMobileLayout extends StatefulWidget {
  const CitiesMobileLayout({
    super.key,
  });

  @override
  State<CitiesMobileLayout> createState() => _CitiesMobileLayoutState();
}

class _CitiesMobileLayoutState extends State<CitiesMobileLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 44.0,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'List',
                ),
                Tab(text: 'Map'),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
                switch (state.status) {
                  case CitiesStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case CitiesStatus.data:
                    return TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CitiesList(
                          cities: state.cities,
                          isLastPage: state.isLastPage,
                          getNextPage: () =>
                              context.read<CitiesCubit>().getNextPage(),
                        ),
                        // CitiesMap(
                        //   cities: state.cities,
                        // ),
                        Text('Map'),
                      ],
                    );
                  case CitiesStatus.error:
                    return const Center(
                      child: Text(
                          'Ooops, something was wrong, please, try again later'),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
