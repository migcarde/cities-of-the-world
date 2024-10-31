import 'package:data/local/entities/city_local_entity.dart';
import 'package:data/local/entities/country_local_entity.dart';
import 'package:data/local/entities/page_local_entity.dart';
import 'package:data/local/entities/pagination_local_entity.dart';
import 'package:data/remote/entities/base_response_remote_entity.dart';
import 'package:data/remote/entities/city_remote_entity.dart';
import 'package:data/remote/entities/country_remote_entity.dart';
import 'package:data/remote/entities/page_remote_entity.dart';

// Remote entities
final baseResponseRemoteEntity = BaseResponseRemoteEntity(
  time: 31031401,
  data: PageRemoteEntity(
    items: [
      CityRemoteEntity(
        id: 1,
        name: 'Chipiona',
        localName: 'Chipiona',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        countryId: 2,
        country: CountryRemoteEntity(
          id: 3,
          name: 'Spain',
          code: '01123',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          continentId: 4,
        ),
      ),
    ],
  ),
);

// Local entities
final pageLocalEntity = PageLocalEntity(
  search: 'Chipiona',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 25,
    total: 250,
  ),
);

final pageLocalEntityPage2 = PageLocalEntity(
  search: 'Rota',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Rota',
      localName: 'Rota',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 2,
    lastPage: 10,
    perPage: 25,
    total: 250,
  ),
);

final pageLocalEntityWithEmptySearch = PageLocalEntity(
  search: '',
  items: [
    CityLocalEntity(
      id: 1,
      name: 'Chipiona',
      localName: 'Chipiona',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      countryId: 2,
      country: CountryLocalEntity(
        id: 3,
        name: 'Spain',
        code: '01123',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        continentId: 4,
      ),
    ),
  ],
  pagination: PaginationLocalEntity(
    currentPage: 1,
    lastPage: 10,
    perPage: 25,
    total: 250,
  ),
);
