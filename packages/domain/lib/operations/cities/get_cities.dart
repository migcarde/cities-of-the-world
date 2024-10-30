import 'package:domain/base/base_use_case.dart';
import 'package:domain/base/result.dart';
import 'package:domain/models/base_response_entity.dart';
import 'package:domain/operations/cities/get_cities_params.dart';
import 'package:domain/repositories/cities/cities_repository.dart';

class GetCities
    implements BaseUseCase<Result<BaseResponseEntity>, GetCitiesParams> {
  final CitiesRepository citiesRepository;

  const GetCities({
    required this.citiesRepository,
  });

  @override
  Future<Result<BaseResponseEntity>> call(GetCitiesParams params) =>
      citiesRepository.getCities(
        page: params.page,
        include: params.include,
        name: params.name,
      );
}
