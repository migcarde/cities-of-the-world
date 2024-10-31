// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryRemoteEntity _$CountryRemoteEntityFromJson(Map<String, dynamic> json) =>
    CountryRemoteEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      continentId: (json['continent_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountryRemoteEntityToJson(
        CountryRemoteEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'continent_id': instance.continentId,
    };
