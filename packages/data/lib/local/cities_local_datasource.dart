import 'package:data/local/entities/page_local_entity.dart';

abstract class CitiesLocalDatasource {
  Future<PageLocalEntity?> getCities({
    String? search,
    int? page,
  });
  Future<void> saveCities(PageLocalEntity page);
}
