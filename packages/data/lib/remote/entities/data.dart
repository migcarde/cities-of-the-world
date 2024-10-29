import 'package:data/remote/entities/city.dart';
import 'package:data/remote/entities/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<City>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
