// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityLocalEntityAdapter extends TypeAdapter<CityLocalEntity> {
  @override
  final int typeId = 2;

  @override
  CityLocalEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityLocalEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      localName: fields[2] as String,
      countryId: fields[5] as int,
      country: fields[6] as CountryLocalEntity?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as DateTime?,
      latitude: fields[7] as double?,
      longitude: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CityLocalEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.localName)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.countryId)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.latitude)
      ..writeByte(8)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityLocalEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
