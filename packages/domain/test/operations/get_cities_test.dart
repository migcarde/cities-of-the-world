import 'package:domain/base/result.dart';
import 'package:domain/operations/cities/get_cities.dart';
import 'package:domain/repositories/cities/cities_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/cities_test_domain_entities.dart';

class CitiesRepositoryMock extends Mock implements CitiesRepository {}

void main() {
  late CitiesRepositoryMock citiesRepository;
  late GetCities getCities;

  setUp(() {
    citiesRepository = CitiesRepositoryMock();
    getCities = GetCities(citiesRepository: citiesRepository);
  });

  group('Get cities -', () {
    test('Success without parameters', () async {
      // Given
      when(() => citiesRepository.getCities())
          .thenAnswer((_) async => Result.success(baseResponseEntity));

      // When
      final result = await getCities(getCitiesEmptyParams);

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRepository.getCities()).called(1);
    });

    test('Success with name parameter', () async {
      // Given
      when(() => citiesRepository.getCities(name: 'na'))
          .thenAnswer((_) async => Result.success(baseResponseEntity));

      // When
      final result = await getCities(getCitiesWithNameParams);

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRepository.getCities(name: 'na')).called(1);
    });

    test('Success with page parameter', () async {
      // Given
      when(() => citiesRepository.getCities(page: 1))
          .thenAnswer((_) async => Result.success(baseResponseEntity));

      // When
      final result = await getCities(getCitiesWithPageParams);

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRepository.getCities(page: 1)).called(1);
    });

    test('Success with include parameter', () async {
      // Given
      when(() => citiesRepository.getCities(include: 'country'))
          .thenAnswer((_) async => Result.success(baseResponseEntity));

      // When
      final result = await getCities(getCitiesWithIncludeParams);

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRepository.getCities(include: 'country')).called(1);
    });

    test('Success with all parameters', () async {
      // Given
      when(() => citiesRepository.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).thenAnswer((_) async => Result.success(baseResponseEntity));

      // When
      final result = await getCities(getCitiesWithAllParams);

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRepository.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => citiesRepository.getCities())
          .thenAnswer((_) async => Result.failure(Exception()));

      // When
      final result = await getCities(getCitiesEmptyParams);

      // Then
      expect(result, isA<Failure>());
      verify(() => citiesRepository.getCities()).called(1);
    });
  });
}
