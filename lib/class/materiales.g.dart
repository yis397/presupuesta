// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materiales.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialesAdapter extends TypeAdapter<Materiales> {
  @override
  final int typeId = 1;

  @override
  Materiales read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Materiales()
      ..bloques = (fields[0] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList()
      ..cementos = (fields[1] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList()
      ..arenas = (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList()
      ..gravas = (fields[3] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList()
      ..varillas = (fields[4] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList()
      ..piedras = (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList();
  }

  @override
  void write(BinaryWriter writer, Materiales obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bloques)
      ..writeByte(1)
      ..write(obj.cementos)
      ..writeByte(2)
      ..write(obj.arenas)
      ..writeByte(3)
      ..write(obj.gravas)
      ..writeByte(4)
      ..write(obj.varillas)
      ..writeByte(5)
      ..write(obj.piedras);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
