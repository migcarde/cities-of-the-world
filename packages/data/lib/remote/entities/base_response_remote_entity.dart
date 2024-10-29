import 'package:json_annotation/json_annotation.dart';

import 'page_remote_entity.dart';

part 'base_response_remote_entity.g.dart';

@JsonSerializable()
class BaseResponseRemoteEntity {
  PageRemoteEntity? data;
  int? time;

  BaseResponseRemoteEntity({this.data, this.time});

  factory BaseResponseRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseRemoteEntityToJson(this);
}
