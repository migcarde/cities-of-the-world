import 'package:data/local/entities/city_local_entity.dart';
import 'package:data/local/entities/country_local_entity.dart';
import 'package:data/local/entities/page_local_entity.dart';
import 'package:data/local/entities/pagination_local_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveAdapters {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(CityLocalEntityAdapter())
      ..registerAdapter(CountryLocalEntityAdapter())
      ..registerAdapter(PageLocalEntityAdapter())
      ..registerAdapter(PaginationLocalEntityAdapter());
  }
}
