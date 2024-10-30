import 'package:domain/domain.dart';

class SaveCitiesParams {
  final String search;
  final PageEntity page;

  const SaveCitiesParams({
    required this.search,
    required this.page,
  });
}
