part of 'cities_cubit.dart';

enum CitiesStatus {
  loading,
  data,
  error,
  empty,
}

class CitiesState extends Equatable {
  final CitiesStatus status;
  final List<CityViewModel> cities;
  final int currentPage;
  final int lastPage;
  final String currentSearch;

  const CitiesState({
    this.status = CitiesStatus.loading,
    this.cities = const [],
    this.currentPage = 1,
    this.lastPage = 1,
    this.currentSearch = '',
  });

  bool get isLastPage => currentPage >= lastPage;

  @override
  List<Object?> get props => [
        status,
        cities,
        currentPage,
        lastPage,
        currentSearch,
      ];

  CitiesState copyWith({
    CitiesStatus? status,
    List<CityViewModel>? cities,
    int? currentPage,
    int? lastPage,
    String? currentSearch,
  }) =>
      CitiesState(
        status: status ?? this.status,
        cities: cities ?? this.cities,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        currentSearch: currentSearch ?? this.currentSearch,
      );
}
