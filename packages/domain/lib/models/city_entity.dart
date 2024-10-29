import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/models/country_entity.dart';

class CityEntity extends Equatable {
  final int id;
  final String name;
  final String localName;
  final int countryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CountryEntity? countryEntity;

  const CityEntity({
    required this.id,
    required this.name,
    required this.localName,
    required this.countryId,
    this.createdAt,
    this.updatedAt,
    this.countryEntity,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        localName,
        countryId,
        createdAt,
        updatedAt,
        countryEntity,
      ];
}

extension CityRemoteEntityExtensions on CityRemoteEntity {
  CityEntity get entity => CityEntity(
        id: id ?? -1,
        name: name ?? '',
        localName: localName ?? '',
        countryId: countryId ?? -1,
        createdAt: createdAt,
        updatedAt: updatedAt,
        countryEntity: country?.entity,
      );
}
