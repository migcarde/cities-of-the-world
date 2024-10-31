import 'package:bloc_test/bloc_test.dart';
import 'package:cities_of_the_world/ui/cities/cubit/cities_cubit.dart';
import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities/cities_test_cubit_entities.dart';

class GetCitiesMock extends Mock implements GetCities {}

void main() {
  late GetCitiesMock getCities;
  late CitiesCubit cubit;

  setUp(() {
    getCities = GetCitiesMock();
    cubit = CitiesCubit(getCities: getCities);
  });

  tearDown(() {
    cubit.close();
  });

  group('Init -', () {
    blocTest<CitiesCubit, CitiesState>(
      'emits [loading, data] when does not have local data and get from remote.',
      build: () {
        // Given
        when(() => getCities(const GetCitiesParams(include: 'country')))
            .thenAnswer((_) async => Result.success(pageEntityWithLocation));

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => const <CitiesState>[
        CitiesState(),
        CitiesState(
          status: CitiesStatus.data,
          cities: [cityViewModel],
          currentPage: 1,
          lastPage: 10,
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [loading, empty] when does not have local data and get from remote returns empty data.',
      build: () {
        // Given
        when(() => getCities(const GetCitiesParams(include: 'country')))
            .thenAnswer((_) async => Result.success(pageEntityWithoutItems));

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => const <CitiesState>[
        CitiesState(),
        CitiesState(
          status: CitiesStatus.empty,
          cities: [],
          currentPage: 1,
          lastPage: 10,
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [loading, error] when does not have local data and get from remote throws an exception.',
      build: () {
        // Given
        when(() => getCities(const GetCitiesParams(include: 'country')))
            .thenAnswer((_) async => Result.failure(Exception()));

        // When
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => const <CitiesState>[
        CitiesState(),
        CitiesState(
          status: CitiesStatus.error,
        )
      ],
    );
  });

  group('Get next page -', () {
    blocTest<CitiesCubit, CitiesState>(
      'emits [data] when does not have local data and get from remote.',
      build: () {
        // Given
        when(() =>
                getCities(const GetCitiesParams(include: 'country', page: 2)))
            .thenAnswer((_) async => Result.success(pageEntityWithoutLocation));

        // When
        return cubit;
      },
      act: (cubit) => cubit.getNextPage(),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          status: CitiesStatus.data,
          cities: [
            cityViewModel,
            cityViewModelWithoutLocation,
          ],
          currentPage: 2,
          lastPage: 10,
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [data] when does not have local data and get from remote returns empty data.',
      build: () {
        // Given
        when(() =>
                getCities(const GetCitiesParams(include: 'country', page: 2)))
            .thenAnswer((_) async => Result.success(pageEntityWithoutItems));

        // When
        return cubit;
      },
      act: (cubit) => cubit.getNextPage(),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          status: CitiesStatus.data,
          cities: [
            cityViewModel,
          ],
          currentPage: 2,
          lastPage: 10,
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [error] when does not have local data and get from remote throws an exception.',
      build: () {
        // Given
        when(() =>
                getCities(const GetCitiesParams(include: 'country', page: 2)))
            .thenAnswer((_) async => Result.failure(Exception()));

        // When
        return cubit;
      },
      act: (cubit) => cubit.getNextPage(),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          status: CitiesStatus.error,
          cities: [
            cityViewModel,
          ],
          lastPage: 10,
        )
      ],
    );
  });

  group('Search by city -', () {
    blocTest<CitiesCubit, CitiesState>(
      'emits [data] when does not have local data and get from remote.',
      build: () {
        // Given
        when(() => getCities(
                const GetCitiesParams(include: 'country', name: 'on')))
            .thenAnswer((_) async => Result.success(pageEntityWithoutLocation));

        // When
        return cubit;
      },
      act: (cubit) => cubit.searchByCity(city: 'on'),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          cities: [cityViewModel],
          lastPage: 10,
          currentSearch: 'on',
        ),
        CitiesState(
          status: CitiesStatus.data,
          cities: [
            cityViewModelWithoutLocation,
          ],
          currentPage: 1,
          lastPage: 10,
          currentSearch: 'on',
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [empty] when does not have local data and get from remote and returns empty data.',
      build: () {
        // Given
        when(() => getCities(
                const GetCitiesParams(include: 'country', name: 'on')))
            .thenAnswer((_) async => Result.success(pageEntityWithoutItems));

        // When
        return cubit;
      },
      act: (cubit) => cubit.searchByCity(city: 'on'),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          cities: [cityViewModel],
          lastPage: 10,
          currentSearch: 'on',
        ),
        CitiesState(
          status: CitiesStatus.empty,
          currentPage: 1,
          lastPage: 10,
          currentSearch: 'on',
        )
      ],
    );

    blocTest<CitiesCubit, CitiesState>(
      'emits [error] when does not have local data and get from remote and throws an exception.',
      build: () {
        // Given
        when(() => getCities(
                const GetCitiesParams(include: 'country', name: 'on')))
            .thenAnswer((_) async => Result.failure(Exception()));

        // When
        return cubit;
      },
      act: (cubit) => cubit.searchByCity(city: 'on'),
      seed: () => const CitiesState(
        status: CitiesStatus.data,
        cities: [cityViewModel],
        currentPage: 1,
        lastPage: 10,
      ),
      expect: () => const <CitiesState>[
        CitiesState(
          cities: [cityViewModel],
          lastPage: 10,
          currentSearch: 'on',
        ),
        CitiesState(
          status: CitiesStatus.error,
          cities: [
            cityViewModel,
          ],
          currentPage: 1,
          lastPage: 10,
          currentSearch: 'on',
        )
      ],
    );
  });
}
