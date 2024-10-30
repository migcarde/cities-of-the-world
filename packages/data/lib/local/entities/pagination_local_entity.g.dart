// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationLocalEntityAdapter extends TypeAdapter<PaginationLocalEntity> {
  @override
  final int typeId = 1;

  @override
  PaginationLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationLocalEntity(
      currentPage: fields[0] as int,
      lastPage: fields[2] as int,
      perPage: fields[3] as int,
      total: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PaginationLocalEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(2)
      ..write(obj.lastPage)
      ..writeByte(3)
      ..write(obj.perPage)
      ..writeByte(4)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
