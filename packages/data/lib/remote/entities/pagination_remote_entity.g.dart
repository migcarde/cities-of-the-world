// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRemoteEntity _$PaginationRemoteEntityFromJson(
        Map<String, dynamic> json) =>
    PaginationRemoteEntity(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationRemoteEntityToJson(
        PaginationRemoteEntity instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
