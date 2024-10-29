import 'package:json_annotation/json_annotation.dart';

part 'country_remote_entity.g.dart';

@JsonSerializable()
class CountryRemoteEntity {
  int? id;
  String? name;
  String? code;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'continent_id')
  int? continentId;

  CountryRemoteEntity({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.continentId,
  });

  factory CountryRemoteEntity.fromJson(Map<String, dynamic> json) {
    return _$CountryRemoteEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryRemoteEntityToJson(this);
}
