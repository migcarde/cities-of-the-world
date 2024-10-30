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
  final CountryEntity? country;
  final double? latitude;
  final double? longitude;

  const CityEntity({
    required this.id,
    required this.name,
    required this.localName,
    required this.countryId,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        localName,
        countryId,
        createdAt,
        updatedAt,
        country,
        latitude,
        longitude,
      ];

  CityEntity copyWith({
    int? id,
    String? name,
    String? localName,
    int? countryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    CountryEntity? country,
    double? latitude,
    double? longitude,
  }) =>
      CityEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        localName: localName ?? this.localName,
        countryId: countryId ?? this.countryId,
        country: country ?? this.country,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  CityLocalEntity get localEntity => CityLocalEntity(
        id: id,
        name: name,
        localName: localName,
        countryId: countryId,
        country: country?.localEntity,
        createdAt: createdAt,
        updatedAt: updatedAt,
        latitude: latitude,
        longitude: longitude,
      );
}

extension CityRemoteEntityExtensions on CityRemoteEntity {
  CityEntity get entity => CityEntity(
        id: id ?? -1,
        name: name ?? '',
        localName: localName ?? '',
        countryId: countryId ?? -1,
        createdAt: createdAt,
        updatedAt: updatedAt,
        country: country?.entity,
      );
}

extension CityLocalEntityExtensions on CityLocalEntity {
  CityEntity get entity => CityEntity(
        id: id,
        name: name,
        localName: localName,
        countryId: countryId,
        country: country?.entity,
        createdAt: createdAt,
        updatedAt: updatedAt,
        latitude: latitude,
        longitude: longitude,
      );
}
