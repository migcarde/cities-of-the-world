// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryLocalEntityAdapter extends TypeAdapter<CountryLocalEntity> {
  @override
  final int typeId = 3;

  @override
  CountryLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryLocalEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      code: fields[2] as String,
      continentId: fields[5] as int,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryLocalEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.continentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
