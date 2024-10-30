import 'package:core/core.dart';
import 'package:domain/domain.dart';

class CityViewModel extends Equatable {
  final String name;
  final String location;
  final String country;

  const CityViewModel({
    required this.name,
    required this.location,
    required this.country,
  });

  @override
  List<Object?> get props => [
        name,
        location,
        country,
      ];
}

extension CityEntityExtensions on CityEntity {
  CityViewModel get viewModel => CityViewModel(
        name: name,
        location: localName,
        country: country?.name ?? '',
      );
}
