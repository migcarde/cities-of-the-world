// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageLocalEntityAdapter extends TypeAdapter<PageLocalEntity> {
  @override
  final int typeId = 4;

  @override
  PageLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageLocalEntity(
      items: (fields[0] as List).cast<CityLocalEntity>(),
      pagination: fields[1] as PaginationLocalEntity,
      search: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PageLocalEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.pagination)
      ..writeByte(2)
      ..write(obj.search);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
