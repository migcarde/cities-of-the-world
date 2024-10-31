// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityRemoteEntity _$CityRemoteEntityFromJson(Map<String, dynamic> json) =>
    CityRemoteEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      localName: json['local_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      countryId: (json['country_id'] as num?)?.toInt(),
      country: json['country'] == null
          ? null
          : CountryRemoteEntity.fromJson(
              json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityRemoteEntityToJson(CityRemoteEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'local_name': instance.localName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'country_id': instance.countryId,
      'country': instance.country,
    };
