import 'package:core/core.dart';
import 'package:data/local/entities/city_local_entity.dart';
import 'package:data/local/entities/local_models_ids.dart';
import 'package:data/local/entities/pagination_local_entity.dart';
import 'package:hive/hive.dart';

part 'page_local_entity.g.dart';

@HiveType(typeId: LocalModelsIds.pageLocalEntity)
class PageLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final List<CityLocalEntity> items;
  @HiveField(1)
  final PaginationLocalEntity pagination;
  @HiveField(2)
  final String search;

  PageLocalEntity({
    required this.items,
    required this.pagination,
    required this.search,
  });

  @override
  List<Object?> get props => [
        items,
        pagination,
        search,
      ];
}
