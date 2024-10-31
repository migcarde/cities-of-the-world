import 'package:core/core.dart';
import 'package:data/local/entities/city_local_entity.dart';
import 'package:data/local/entities/country_local_entity.dart';
import 'package:data/local/entities/page_local_entity.dart';
import 'package:data/local/entities/pagination_local_entity.dart';
import 'package:data/remote/entities/base_response_remote_entity.dart';
import 'package:data/remote/entities/city_remote_entity.dart';
import 'package:data/remote/entities/country_remote_entity.dart';
import 'package:data/remote/entities/page_remote_entity.dart';
import 'package:data/remote/entities/pagination_remote_entity.dart';
import 'package:domain/domain.dart';

final _createdAt = DateTime.now();
final _updatedAt = DateTime.now();

// Remote entities
final baseResponseRemoteEntity = BaseResponseRemoteEntity(
  time: 31031401,
  data: PageRemoteEntity(
    items: [
      CityRemoteEntity(
        id: 1,
        name: 'Chipiona',
        localName: 'Chipiona',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        countryId: 2,
        country: CountryRemoteEntity(
          id: 3,
          name: 'Spain',
          code: '01123',
          createdAt: _createdAt,
          updatedAt: _updatedAt,
          continentId: 4,
        ),
      ),
    ],
    pagination: PaginationRemoteEntity(
      currentPage: 1,
      lastPage: 10,
      perPage: 24,
      total: 100,
    ),
  ),
);

final pageRemoteEntityWithDifferenteLocalName = PageRemoteEntity(
  items: [
    CityRemoteEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Sanlucar',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      country: CountryRemoteEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationRemoteEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

// Entities
final baseResponseEntity = BaseResponseEntity(
  time: 31031401,
  data: PageEntity(
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
  ),
);

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

final pageEntityWithDifferentLocalName = PageEntity(
  items: [
    CityEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Sanlucar',
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

final pageEntityWithDifferentLocalNameWihoutLocation = PageEntity(
  items: [
    CityEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Sanlucar',
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

// Get cities params
const getCitiesEmptyParams = GetCitiesParams();

const getCitiesWithNameParams = GetCitiesParams(name: 'na');

const getCitiesWithPageParams = GetCitiesParams(page: 1);

const getCitiesWithIncludeParams = GetCitiesParams(include: 'country');

const getCitiesWithAllParams = GetCitiesParams(
  name: 'na',
  page: 1,
  include: 'country',
);

// Local entities
final pageLocalEntity = PageLocalEntity(
  search: 'Chipiona',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

final pageLocalEntityPage2 = PageLocalEntity(
  search: 'Rota',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Rota',
      localName: 'Rota',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

final pageLocalEntityWithEmptySearch = PageLocalEntity(
  search: '',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: _createdAt,
      updatedAt: _updatedAt,
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 24,
    total: 100,
  ),
);

// Location entities
const locationEntity = LocationEntity(
  latitude: 120.0,
  longitude: 60.0,
);
