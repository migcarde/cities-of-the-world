import 'package:domain/base/base_use_case.dart';
import 'package:domain/base/result.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/cities/cities_repository.dart';

class GetCities implements BaseUseCase<Result<PageEntity>, GetCitiesParams?> {
  final CitiesRepository citiesRepository;

  const GetCities({
    required this.citiesRepository,
  });

  @override
  Future<Result<PageEntity>> call([GetCitiesParams? params]) =>
      citiesRepository.getCities(
        page: params?.page,
        include: params?.include,
        name: params?.name,
      );
}
