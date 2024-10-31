import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/base/result.dart';
import 'package:domain/repositories/cities/cities_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/cities_test_domain_entities.dart';

class CitiesRemoteDatasourceMock extends Mock
    implements CitiesRemoteDatasource {}

class CitiesLocalDatasourceMock extends Mock implements CitiesLocalDatasource {}

class LocationServiceMock extends Mock implements LocationService {}

void main() {
  late CitiesRemoteDatasourceMock citiesRemoteDatasource;
  late CitiesLocalDatasourceMock citiesLocalDatasource;
  late LocationServiceMock locationService;
  late CitiesRepositoryImpl citiesRepository;

  setUp(() {
    citiesRemoteDatasource = CitiesRemoteDatasourceMock();
    citiesLocalDatasource = CitiesLocalDatasourceMock();
    locationService = LocationServiceMock();
    citiesRepository = CitiesRepositoryImpl(
      citiesRemoteDatasource: citiesRemoteDatasource,
      citiesLocalDatasource: citiesLocalDatasource,
      locationService: locationService,
    );
  });

  group('Get cities -', () {
    test('Success without parameters', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities())
          .thenAnswer((_) async => baseResponseRemoteEntity);
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCities();

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesRemoteDatasource.getCities()).called(1);
    });

    test('Success with name parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(name: 'na'))
          .thenAnswer((_) async => baseResponseRemoteEntity);
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCities(
        name: 'na',
      );

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesRemoteDatasource.getCities(name: 'na')).called(1);
    });

    test('Success with page parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(page: 1))
          .thenAnswer((_) async => baseResponseRemoteEntity);
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCities(
        page: 1,
      );

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesRemoteDatasource.getCities(page: 1)).called(1);
    });

    test('Success with include parameter', () async {
      // Given
      when(() => citiesRemoteDatasource.getCities(include: 'country'))
          .thenAnswer((_) async => baseResponseRemoteEntity);
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCities(
        include: 'country',
      );

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
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
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCities(
        name: 'na',
        page: 1,
        include: 'country',
      );

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesRemoteDatasource.getCities(
            name: 'na',
            page: 1,
            include: 'country',
          )).called(1);
    });

    test('Success with local data', () async {
      // Given
      when(() => citiesLocalDatasource.getCities())
          .thenAnswer((_) async => pageLocalEntity);

      // When
      final result = await citiesRepository.getCities();

      // Then
      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesLocalDatasource.getCities()).called(1);
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

  group('Save cities', () {
    test('Success with empty search', () async {
      // Given
      when(() =>
              citiesLocalDatasource.saveCities(pageLocalEntityWithEmptySearch))
          .thenAnswer((_) async {});

      // When
      final result = await citiesRepository.saveCities(
        search: '',
        page: baseResponseEntity.data!,
      );

      expect(result, isA<Success>());
      verify(
        () => citiesLocalDatasource.saveCities(
          pageLocalEntityWithEmptySearch,
        ),
      ).called(1);
    });

    test('Success with search', () async {
      // Given
      when(() => citiesLocalDatasource.saveCities(pageLocalEntity))
          .thenAnswer((_) async {});

      // When
      final result = await citiesRepository.saveCities(
        search: 'Chipiona',
        page: baseResponseEntity.data!,
      );

      expect(result, isA<Success>());
      verify(
        () => citiesLocalDatasource.saveCities(
          pageLocalEntity,
        ),
      ).called(1);
    });
  });

  group('Get cities from local -', () {
    test('Success with default parameters', () async {
      // Given
      when(() => citiesLocalDatasource.getCities(
            search: '',
            page: 1,
          )).thenAnswer((_) async => pageLocalEntityWithEmptySearch);

      // When
      final result = await citiesRepository.getCitiesFromLocal(
        search: '',
        page: 1,
      );

      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesLocalDatasource.getCities(search: '', page: 1))
          .called(1);
    });

    test('Success with search', () async {
      // Given
      when(() => citiesLocalDatasource.getCities(
            search: 'na',
            page: 1,
          )).thenAnswer((_) async => pageLocalEntity);

      // When
      final result = await citiesRepository.getCitiesFromLocal(
        search: 'na',
        page: 1,
      );

      expect((result as Success).data, baseResponseEntity.data!);
      verify(() => citiesLocalDatasource.getCities(search: 'na', page: 1))
          .called(1);
    });

    test('Success with no results', () async {
      // Given
      when(() => citiesLocalDatasource.getCities(
            search: 'na',
            page: 1,
          )).thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getCitiesFromLocal(
        search: 'na',
        page: 1,
      );

      expect((result as Success).data, isNull);
      verify(() => citiesLocalDatasource.getCities(search: 'na', page: 1))
          .called(1);
    });

    test('Failure', () async {
      // Given
      when(() => citiesLocalDatasource.getCities(
            search: 'na',
            page: 1,
          )).thenThrow(Exception());

      // When
      final result = await citiesRepository.getCitiesFromLocal(
        search: 'na',
        page: 1,
      );

      expect(result, isA<Failure>());
      verify(() => citiesLocalDatasource.getCities(search: 'na', page: 1))
          .called(1);
    });
  });

  group('Get entities with coordinates -', () {
    test('Success with city name', () async {
      // Given
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => locationEntity);

      // When
      final result = await citiesRepository.getEntitiesWithCoordinates(
        pageRemoteEntity: baseResponseRemoteEntity.data!,
      );

      expect(result, pageEntityWithLocation);
      verify(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .called(1);
    });

    test('Success with city local name', () async {
      // Given
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);
      when(() => locationService.getLocationFromAddress(address: 'Sanlucar'))
          .thenAnswer((_) async => locationEntity);

      // When
      final result = await citiesRepository.getEntitiesWithCoordinates(
        pageRemoteEntity: pageRemoteEntityWithDifferenteLocalName,
      );

      expect(result, pageEntityWithDifferentLocalName);
      verify(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .called(1);
      verify(() => locationService.getLocationFromAddress(address: 'Sanlucar'))
          .called(1);
    });

    test('Success with null value', () async {
      // Given
      when(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .thenAnswer((_) async => null);
      when(() => locationService.getLocationFromAddress(address: 'Sanlucar'))
          .thenAnswer((_) async => null);

      // When
      final result = await citiesRepository.getEntitiesWithCoordinates(
        pageRemoteEntity: pageRemoteEntityWithDifferenteLocalName,
      );

      expect(result, pageEntityWithDifferentLocalNameWihoutLocation);
      verify(() => locationService.getLocationFromAddress(address: 'Chipiona'))
          .called(1);
      verify(() => locationService.getLocationFromAddress(address: 'Sanlucar'))
          .called(1);
    });
  });
}
