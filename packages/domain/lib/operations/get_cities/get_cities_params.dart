import 'package:core/core.dart';

class GetCitiesParams extends Equatable {
  final int? page;
  final String? include;
  final String? name;

  const GetCitiesParams({
    this.page,
    this.include,
    this.name,
  });

  @override
  List<Object?> get props => [
        page,
        include,
        name,
      ];
}
