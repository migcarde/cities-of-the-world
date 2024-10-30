import 'package:data/remote/entities/base_response_remote_entity.dart';
import 'package:data/remote/entities/city_remote_entity.dart';
import 'package:data/remote/entities/country_remote_entity.dart';
import 'package:data/remote/entities/page_remote_entity.dart';
import 'package:data/remote/entities/pagination_remote_entity.dart';
import 'package:domain/domain.dart';
import 'package:domain/operations/cities/get_cities_params.dart';

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
