import 'package:core/core.dart';
import 'package:data/local/entities/local_models_ids.dart';
import 'package:hive/hive.dart';

part 'country_local_entity.g.dart';

@HiveType(typeId: LocalModelsIds.countryLocalEntity)
class CountryLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String code;

  @HiveField(3)
  final DateTime? createdAt;

  @HiveField(4)
  final DateTime? updatedAt;

  @HiveField(5)
  final int continentId;

  CountryLocalEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.continentId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        createdAt,
        updatedAt,
        continentId,
      ];
}
