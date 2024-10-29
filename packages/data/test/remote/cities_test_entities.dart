import 'package:data/remote/entities/base_response_remote_entity.dart';
import 'package:data/remote/entities/city_remote_entity.dart';
import 'package:data/remote/entities/country_remote_entity.dart';
import 'package:data/remote/entities/page_remote_entity.dart';

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
