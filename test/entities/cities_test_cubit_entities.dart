import 'package:cities_of_the_world/ui/cities/models/city_view_model.dart';
import 'package:domain/models/city_entity.dart';
import 'package:domain/models/country_entity.dart';
import 'package:domain/models/page_entity.dart';
import 'package:domain/models/pagination_entity.dart';

final _createdAt = DateTime.now();
final _updatedAt = DateTime.now();

// Entities
final pageEntityWithLocation = PageEntity(
  items: [
    CityEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      latitude: 120.0,
      longitude: 60.0,
      country: CountryEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: const PaginationEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

final pageEntityWithoutLocation = PageEntity(
  items: [
    CityEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      country: CountryEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: const PaginationEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

const pageEntityWithoutItems = PageEntity(
  items: [],
  pagination: PaginationEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

// View models
const cityViewModel = CityViewModel(
  name: 'Chipiona',
  country: 'Spain',
  latitude: 120.0,
  longitude: 60.0,
);

const cityViewModelWithoutLocation = CityViewModel(
  name: 'Chipiona',
  country: 'Spain',
);
