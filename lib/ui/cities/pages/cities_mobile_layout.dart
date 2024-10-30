import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:cities_of_the_world/ui/cities/widgets/cities_list.dart';
import 'package:cities_of_the_world/ui/cities/widgets/cities_map.dart';
import 'package:flutter/material.dart';

class CitiesMobileLayout extends StatelessWidget {
  const CitiesMobileLayout({
    super.key,
    required this.tabController,
    required this.cities,
    required this.isLastPage,
    required this.getNextPage,
  });

  final TabController tabController;
  final List<CityViewModel> cities;
  final bool isLastPage;
  final VoidCallback getNextPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 44.0,
            child: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'List',
                ),
                Tab(text: 'Map'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CitiesList(
                  cities: cities,
                  isLastPage: isLastPage,
                  getNextPage: getNextPage,
                ),
                CitiesMap(
                  cities: cities,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
