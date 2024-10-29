import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  Page? data;
  int? time;

  BaseResponse({this.data, this.time});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
