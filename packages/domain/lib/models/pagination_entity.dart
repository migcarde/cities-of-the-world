import 'package:core/core.dart';
import 'package:data/data.dart';

class PaginationEntity extends Equatable {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const PaginationEntity({
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

  PaginationLocalEntity get localEntity => PaginationLocalEntity(
        currentPage: currentPage,
        lastPage: lastPage,
        perPage: perPage,
        total: total,
      );
}

extension PaginationRemoteEntityExtensions on PaginationRemoteEntity {
  PaginationEntity get entity => PaginationEntity(
        currentPage: currentPage ?? 0,
        lastPage: lastPage ?? 0,
        perPage: perPage ?? 0,
        total: total ?? 0,
      );
}

extension PaginationLocalEntityExtensions on PaginationLocalEntity {
  PaginationEntity get entity => PaginationEntity(
        currentPage: currentPage,
        lastPage: lastPage,
        perPage: perPage,
        total: total,
      );
}
