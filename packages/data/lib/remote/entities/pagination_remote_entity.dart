import 'package:json_annotation/json_annotation.dart';

part 'pagination_remote_entity.g.dart';

@JsonSerializable()
class PaginationRemoteEntity {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'per_page')
  int? perPage;
  int? total;

  PaginationRemoteEntity(
      {this.currentPage, this.lastPage, this.perPage, this.total});

  factory PaginationRemoteEntity.fromJson(Map<String, dynamic> json) {
    return _$PaginationRemoteEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationRemoteEntityToJson(this);
}
