import 'package:json_annotation/json_annotation.dart';

import 'country_remote_entity.dart';

part 'city_remote_entity.g.dart';

@JsonSerializable()
class CityRemoteEntity {
  int? id;
  String? name;
  @JsonKey(name: 'local_name')
  String? localName;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'country_id')
  int? countryId;
  CountryRemoteEntity? country;

  CityRemoteEntity({
    this.id,
    this.name,
    this.localName,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.country,
  });

  factory CityRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$CityRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CityRemoteEntityToJson(this);
}
