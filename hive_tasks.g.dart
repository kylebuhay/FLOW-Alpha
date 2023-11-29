// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_tasks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class hivetasksAdapter extends TypeAdapter<hive_tasks> {
  @override
  final int typeId = 1;

  @override
  hive_tasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return hive_tasks(
      name: fields[0] as String,
      desc: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, hive_tasks obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is hivetasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
