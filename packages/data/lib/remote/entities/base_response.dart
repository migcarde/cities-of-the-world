import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  Data? data;
  int? time;

  BaseResponse({this.data, this.time});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
