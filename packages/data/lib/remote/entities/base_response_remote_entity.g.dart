// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseRemoteEntity _$BaseResponseRemoteEntityFromJson(
        Map<String, dynamic> json) =>
    BaseResponseRemoteEntity(
      data: json['data'] == null
          ? null
          : PageRemoteEntity.fromJson(json['data'] as Map<String, dynamic>),
      time: (json['time'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseResponseRemoteEntityToJson(
        BaseResponseRemoteEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'time': instance.time,
    };
