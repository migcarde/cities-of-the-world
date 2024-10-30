import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:cities_of_the_world/ui/cities/widgets/city_list_item.dart';
import 'package:flutter/material.dart';

class CitiesMobileLayout extends StatelessWidget {
  const CitiesMobileLayout({
    super.key,
    required this.cities,
    required this.isLastPage,
    required this.getNextPage,
  });

  final List<CityViewModel> cities;
  final bool isLastPage;
  final VoidCallback getNextPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
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
        itemCount: isLastPage ? cities.length : cities.length + 1,
      ),
    );
  }

  ScrollController _setUpController() {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0 &&
          !isLastPage) {
        getNextPage();
      }
    });

    return scrollController;
  }
}
