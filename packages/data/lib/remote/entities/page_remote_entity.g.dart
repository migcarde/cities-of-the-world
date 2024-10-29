// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageRemoteEntity _$PageRemoteEntityFromJson(Map<String, dynamic> json) =>
    PageRemoteEntity(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CityRemoteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationRemoteEntity.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageRemoteEntityToJson(PageRemoteEntity instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
