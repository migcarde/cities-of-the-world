import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/models/page_entity.dart';

class BaseResponseEntity extends Equatable {
  final PageEntity? data;
  final int time;

  const BaseResponseEntity({
    required this.data,
    required this.time,
  });

  @override
  List<Object?> get props => [
        data,
        time,
      ];
}

extension BaseResponseRemoteEntityExtensions on BaseResponseRemoteEntity {
  BaseResponseEntity get entity => BaseResponseEntity(
        data: data?.entity,
        time: time ?? -1,
      );
}
