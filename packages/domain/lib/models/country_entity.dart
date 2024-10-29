import 'package:core/core.dart';
import 'package:data/data.dart';

class CountryEntity extends Equatable {
  final int id;
  final String name;
  final String code;
  final int continentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CountryEntity({
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
        continentId,
        createdAt,
        updatedAt,
      ];
}

extension CountryRemoteEntityExtensions on CountryRemoteEntity {
  CountryEntity get entity => CountryEntity(
        id: id ?? -1,
        name: name ?? '',
        code: code ?? '',
        continentId: continentId ?? -1,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
