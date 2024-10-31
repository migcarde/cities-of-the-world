import 'package:core/core.dart';
import 'package:data/core/extensions/hive_extensions.dart';
import 'package:data/local/cities_local_datasource.dart';
import 'package:data/local/entities/page_local_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CitiesLocalDatasourceImpl implements CitiesLocalDatasource {
  static const _boxName = 'citiesBox';

  final HiveInterface hive;

  CitiesLocalDatasourceImpl({
    required this.hive,
  });

  @override
  Future<PageLocalEntity?> getCities({
    String? search,
    int? page,
  }) async {
    try {
      PageLocalEntity? result;
      final box = await hive.getBox<PageLocalEntity>(_boxName);

      if (search != null && search.isNotEmpty && page != null && page > 0) {
        result = box.values
            .where((pageLocalEntity) =>
                pageLocalEntity.search
                    .toLowerCase()
                    .contains(search.toLowerCase()) &&
                pageLocalEntity.pagination.currentPage == page)
            .firstOrNull;
      } else if ((search != null && search.isNotEmpty) &&
          (page == null || page == 0)) {
        result = box.values
            .where((pageLocalEntity) => pageLocalEntity.search
                .toLowerCase()
                .contains(search.toLowerCase()))
            .firstOrNull;
      } else if ((search == null || search.isEmpty) &&
          (page != null && page > 0)) {
        result = box.values
            .where((pageLocalEntity) =>
                pageLocalEntity.pagination.currentPage == page)
            .firstOrNull;
      } else {
        result = box.values
            .where((pageLocalEntity) =>
                pageLocalEntity.pagination.currentPage == 1 &&
                pageLocalEntity.search.isEmpty)
            .firstOrNull;
      }
      await box.close();

      return result;
    } catch (e) {
      logger.error(e);

      return null;
    }
  }

  @override
  Future<void> saveCities(PageLocalEntity page) async {
    try {
      final box = await hive.getBox<PageLocalEntity>(_boxName);

      final repeatedPageIndex = box.values.toList().indexWhere(
          (pageLocalEntity) =>
              page.search == pageLocalEntity.search &&
              page.pagination.currentPage ==
                  pageLocalEntity.pagination.currentPage);

      if (repeatedPageIndex >= 0) {
        await box.deleteAt(repeatedPageIndex);
      }

      await box.add(page);
      await box.close();
    } catch (e) {
      logger.error(e);
    }
  }
}
