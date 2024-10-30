import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:cities_of_the_world/ui/cities/widgets/city_list_item.dart';
import 'package:flutter/widgets.dart';

class CitiesMobileLayout extends StatelessWidget {
  const CitiesMobileLayout({
    super.key,
    required this.cities,
  });

  final List<CityViewModel> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final city = cities[index];

        return CityListItem(
          city: city.name,
          location: city.location,
          country: city.country,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10.0,
      ),
      itemCount: cities.length,
    );
  }
}
