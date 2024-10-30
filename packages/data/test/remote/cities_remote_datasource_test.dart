import 'package:data/remote/cities_remote_datasource_impl.dart';
import 'package:data/remote/client/cities_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/cities_test_data_entities.dart';

class CitiesClientMock extends Mock implements CitiesClient {}

void main() {
  late CitiesClientMock citiesClient;
  late CitiesRemoteDatasourceImpl citiesRemoteDatasource;

  setUp(() {
    citiesClient = CitiesClientMock();
    citiesRemoteDatasource = CitiesRemoteDatasourceImpl(client: citiesClient);
  });

  group('Get cities -', () {
    test('Success without parameters', () async {
      // Given
      when(() => citiesClient.getCities())
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRemoteDatasource.getCities();

      // Then
      expect(result, baseResponseRemoteEntity);
      verify(() => citiesClient.getCities()).called(1);
    });

    test('Success with name parameter', () async {
      // Given
      when(() => citiesClient.getCities(name: 'na'))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRemoteDatasource.getCities(
        name: 'na',
      );

      // Then
      expect(result, baseResponseRemoteEntity);
      verify(() => citiesClient.getCities(name: 'na')).called(1);
    });

    test('Success with page parameter', () async {
      // Given
      when(() => citiesClient.getCities(page: 1))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRemoteDatasource.getCities(page: 1);

      // Then
      expect(result, baseResponseRemoteEntity);
      verify(() => citiesClient.getCities(page: 1)).called(1);
    });

    test('Success with include parameter', () async {
      // Given
      when(() => citiesClient.getCities(include: 'country'))
          .thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRemoteDatasource.getCities(
        include: 'country',
      );

      // Then
      expect(result, baseResponseRemoteEntity);
      verify(() => citiesClient.getCities(include: 'country')).called(1);
    });

    test('Success with all parameters', () async {
      // Given
      when(() => citiesClient.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).thenAnswer((_) async => baseResponseRemoteEntity);

      // When
      final result = await citiesRemoteDatasource.getCities(
        name: 'na',
        page: 1,
        include: 'country',
      );

      // Then
      expect(result, baseResponseRemoteEntity);
      verify(() => citiesClient.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => citiesClient.getCities()).thenThrow(Exception());

      // Then
      expect(() async => citiesRemoteDatasource.getCities(),
          throwsA(isInstanceOf<Exception>()));
      verify(() => citiesClient.getCities()).called(1);
    });
  });
}
