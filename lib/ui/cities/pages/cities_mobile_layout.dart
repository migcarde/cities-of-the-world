import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:cities_of_the_world/ui/cities/widgets/city_list_item.dart';
import 'package:flutter/material.dart';

class CitiesMobileLayout extends StatelessWidget {
  const CitiesMobileLayout({
    super.key,
    required this.cities,
    required this.getNextPage,
  });

  final List<CityViewModel> cities;
  final VoidCallback getNextPage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _setUpController(),
      itemBuilder: (context, index) {
        if (index >= cities.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final city = cities[index];

          return CityListItem(
            city: city.name,
            location: city.location,
            country: city.country,
          );
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10.0,
      ),
      itemCount: cities.length + 1,
    );
  }

  ScrollController _setUpController() {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        getNextPage();
      }
    });

    return scrollController;
  }
}
