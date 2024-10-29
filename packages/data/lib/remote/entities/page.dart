import 'package:data/remote/entities/city.dart';
import 'package:data/remote/entities/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  List<City>? items;
  Pagination? pagination;

  Page({this.items, this.pagination});

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
