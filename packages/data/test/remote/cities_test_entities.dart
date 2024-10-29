import 'package:data/remote/entities/base_response.dart';
import 'package:data/remote/entities/city.dart';
import 'package:data/remote/entities/country.dart';
import 'package:data/remote/entities/page.dart';

final baseResponseRemoteEntity = BaseResponse(
  time: 31031401,
  data: Page(
    items: [
      City(
        id: 1,
        name: 'Chipiona',
        localName: 'Chipiona',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        countryId: 2,
        country: Country(
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
