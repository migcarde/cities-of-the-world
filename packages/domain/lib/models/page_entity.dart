import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/models/city_entity.dart';
import 'package:domain/models/pagination_entity.dart';

class PageEntity extends Equatable {
  final List<CityEntity> items;
  final PaginationEntity? pagination;

  const PageEntity({
    required this.items,
    required this.pagination,
  });

  @override
  List<Object?> get props => [
        items,
        pagination,
      ];

  PageLocalEntity localEntity({
    required String search,
  }) =>
      PageLocalEntity(
        items: items.map((item) => item.localEntity).toList(),
        pagination: pagination?.localEntity ??
            PaginationLocalEntity(
              currentPage: 1,
              lastPage: 1,
              perPage: items.length,
              total: items.length,
            ),
        search: search,
      );

  PageEntity copyWith({
    List<CityEntity>? items,
    PaginationEntity? pagination,
  }) =>
      PageEntity(
        items: items ?? this.items,
        pagination: pagination ?? this.pagination,
      );
}

extension PageRemoteEntityExtensions on PageRemoteEntity {
  PageEntity get entity => PageEntity(
        items: items?.map((item) => item.entity).toList() ?? [],
        pagination: pagination?.entity,
      );
}

extension PageLocalEntityExtensions on PageLocalEntity {
  PageEntity get entity => PageEntity(
        items: items.map((item) => item.entity).toList(),
        pagination: pagination.entity,
      );
}
