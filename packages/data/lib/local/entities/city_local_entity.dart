import 'package:core/core.dart';
import 'package:data/local/entities/country_local_entity.dart';
import 'package:data/local/entities/local_models_ids.dart';
import 'package:hive/hive.dart';

part 'city_local_entity.g.dart';

@HiveType(typeId: LocalModelsIds.cityLocalEntity)
class CityLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String localName;

  @HiveField(3)
  final DateTime? createdAt;

  @HiveField(4)
  final DateTime? updatedAt;

  @HiveField(5)
  final int countryId;

  @HiveField(6)
  final CountryLocalEntity? country;

  CityLocalEntity({
    required this.id,
    required this.name,
    required this.localName,
    required this.countryId,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        localName,
        countryId,
        country,
        createdAt,
        updatedAt,
      ];
}
