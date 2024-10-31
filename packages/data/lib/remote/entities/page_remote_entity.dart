import 'package:data/remote/entities/city_remote_entity.dart';
import 'package:data/remote/entities/pagination_remote_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_remote_entity.g.dart';

@JsonSerializable()
class PageRemoteEntity {
  List<CityRemoteEntity>? items;
  PaginationRemoteEntity? pagination;

  PageRemoteEntity({this.items, this.pagination});

  factory PageRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$PageRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PageRemoteEntityToJson(this);
}
