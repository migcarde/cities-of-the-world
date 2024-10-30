import 'package:core/core.dart';
import 'package:data/local/entities/local_models_ids.dart';
import 'package:hive/hive.dart';

part 'pagination_local_entity.g.dart';

@HiveType(typeId: LocalModelsIds.paginationLocalEntity)
class PaginationLocalEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int currentPage;

  @HiveField(2)
  final int lastPage;

  @HiveField(3)
  final int perPage;

  @HiveField(4)
  final int total;

  PaginationLocalEntity({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        lastPage,
        perPage,
        total,
      ];
}
