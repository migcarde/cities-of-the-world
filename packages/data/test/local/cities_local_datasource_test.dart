import 'dart:io';

import 'package:data/local/cities_local_datasource_impl.dart';
import 'package:data/local/entities/page_local_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/cities_test_data_entities.dart';

class BoxMock<T> extends Mock implements Box<T> {}

class HiveInterfaceMock extends Mock implements HiveInterface {}

void main() {
  late BoxMock<PageLocalEntity> box;
  late HiveInterfaceMock hiveInterface;
  late CitiesLocalDatasourceImpl citiesLocalDatasource;

  const boxName = 'citiesBox';

  setUp(() {
    final path = Directory.current.path;
    Hive.init(path);
    box = BoxMock<PageLocalEntity>();
    hiveInterface = HiveInterfaceMock();
    citiesLocalDatasource = CitiesLocalDatasourceImpl(
      hive: hiveInterface,
    );
  });

  group('Get pages -', () {
    test('Success without parameters', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values)
          .thenAnswer((_) => [pageLocalEntityWithEmptySearch]);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      final result = await citiesLocalDatasource.getCities();

      expect(result, pageLocalEntityWithEmptySearch);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Success with search parameter', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => [pageLocalEntity]);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      final result = await citiesLocalDatasource.getCities(search: 'pio');

      expect(result, pageLocalEntity);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Success with page parameter', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => [
            pageLocalEntity,
            pageLocalEntityPage2,
          ]);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      final result = await citiesLocalDatasource.getCities(page: 2);

      expect(result, pageLocalEntityPage2);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Success with all parameters', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => [
            pageLocalEntity,
            pageLocalEntityPage2,
          ]);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      final result = await citiesLocalDatasource.getCities(
        page: 2,
        search: 'ta',
      );

      expect(result, pageLocalEntityPage2);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Success with all parameters but find nothing', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => [
            pageLocalEntity,
            pageLocalEntityPage2,
          ]);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      final result = await citiesLocalDatasource.getCities(
        page: 1,
        search: 'ta',
      );

      expect(result, null);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Failure and return null value', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenThrow(Exception());

      // When
      final result = await citiesLocalDatasource.getCities(
        page: 1,
        search: 'ta',
      );

      expect(result, null);
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
    });
  });

  group('Save page -', () {
    test('Success without repeated index', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => []);
      when(() => box.add(pageLocalEntity)).thenAnswer((_) async => 1);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      await citiesLocalDatasource.saveCities(pageLocalEntity);

      // Then
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.close()).called(1);
    });

    test('Success with repeated index', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenAnswer((_) async => box);
      when(() => box.values).thenAnswer((_) => [
            pageLocalEntity,
            pageLocalEntityPage2,
          ]);
      when(() => box.deleteAt(0)).thenAnswer((_) async => 1);
      when(() => box.add(pageLocalEntity)).thenAnswer((_) async => 1);
      when(() => box.close()).thenAnswer((_) async => {});

      // When
      await citiesLocalDatasource.saveCities(pageLocalEntity);

      // Then
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
      verify(() => box.values).called(1);
      verify(() => box.deleteAt(0)).called(1);
      verify(() => box.close()).called(1);
    });

    test('Failure', () async {
      // Given
      when(() => hiveInterface.isBoxOpen(boxName)).thenAnswer((_) => false);
      when(() => hiveInterface.openBox<PageLocalEntity>(boxName))
          .thenThrow(Exception());

      // When
      await citiesLocalDatasource.saveCities(pageLocalEntity);

      // Then
      verify(() => hiveInterface.openBox<PageLocalEntity>(boxName)).called(1);
    });
  });
}
