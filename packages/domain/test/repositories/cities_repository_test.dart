import 'package:data/data.dart';
import 'package:domain/base/result.dart';
import 'package:domain/repositories/cities/cities_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/cities_test_domain_entities.dart';

class CitiesRemoteDatasourceMock extends Mock
    implements CitiesRemoteDatasource {}

void main() {
  late CitiesRemoteDatasourceMock citiesRemoteDatasource;
  late CitiesRepositoryImpl citiesRepository;

  setUp(() {
    citiesRemoteDatasource = CitiesRemoteDatasourceMock();
    citiesRepository = CitiesRepositoryImpl(
      citiesRemoteDatasource: citiesRemoteDatasource,
    );
  });

  group('Get cities -', () {
    test('Success without parameters', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities())
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRepository.getCities();

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRemoteDatasource.getCities()).called(1);
    });

    test('Success with name parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(name: 'na'))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRepository.getCities(
        name: 'na',
      );

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRemoteDatasource.getCities(name: 'na')).called(1);
    });

    test('Success with page parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(page: 1))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRepository.getCities(
        page: 1,
      );

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRemoteDatasource.getCities(page: 1)).called(1);
    });

    test('Success with include parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(include: 'country'))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRepository.getCities(
        include: 'country',
      );

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRemoteDatasource.getCities(include: 'country'))
          .called(1);
    });

    test('Success with all parameters', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRepository.getCities(
        name: 'na',
        page: 1,
        include: 'country',
      );

      // Then
      expect((result as Success).data, baseResponseEntity);
      verify(() => citiesRemoteDatasource.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities()).thenThrow(Exception());

      // When
      final result = await citiesRepository.getCities();

      // Then
      expect(result, isA<Failure>());
      verify(() => citiesRemoteDatasource.getCities()).called(1);
    });
  });
}
