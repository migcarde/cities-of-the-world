part of 'cities_cubit.dart';

enum CitiesStatus {
  loading,
  data,
  error,
}

class CitiesState extends Equatable {
  final CitiesStatus status;
  final List<CityViewModel> cities;

  const CitiesState({
    this.status = CitiesStatus.loading,
    this.cities = const [],
  });

  @override
  List<Object?> get props => [
        status,
        cities,
      ];

  CitiesState copyWith({
    CitiesStatus? status,
    List<CityViewModel>? cities,
  }) =>
      CitiesState(
        status: status ?? this.status,
        cities: cities ?? this.cities,
      );
}
