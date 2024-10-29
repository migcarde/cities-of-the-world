import 'package:core/core.dart';

abstract class BaseUseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
