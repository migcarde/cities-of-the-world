import 'package:core/core.dart';
import 'package:domain/domain.dart';

class CityViewModel extends Equatable {
  final String name;
  final double? latitude;
  final double? longitude;
  final String country;

  const CityViewModel({
    required this.name,
    required this.country,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        country,
        latitude,
        longitude,
      ];

  bool get hasLatitudeAndLongitude => latitude != null && longitude != null;
}

extension CityEntityExtensions on CityEntity {
  CityViewModel get viewModel => CityViewModel(
        name: name,
        latitude: latitude,
        longitude: longitude,
        country: country?.name ?? '',
      );
}
