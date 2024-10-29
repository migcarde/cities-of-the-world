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
}

extension PageRemoteEntityExtensions on PageRemoteEntity {
  PageEntity get entity => PageEntity(
        items: items?.map((item) => item.entity).toList() ?? [],
        pagination: pagination?.entity,
      );
}
