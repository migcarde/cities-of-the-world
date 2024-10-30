import 'package:domain/base/base_use_case.dart';
import 'package:domain/base/result.dart';
import 'package:domain/operations/save_cities/save_cities_params.dart';
import 'package:domain/repositories/cities/cities_repository.dart';

class SaveCities implements BaseUseCase<Result<void>, SaveCitiesParams> {
  final CitiesRepository citiesRepository;

  const SaveCities({
    required this.citiesRepository,
  });

  @override
  Future<Result<void>> call(SaveCitiesParams params) =>
      citiesRepository.saveCities(
        search: params.search,
        page: params.page,
      );
}
