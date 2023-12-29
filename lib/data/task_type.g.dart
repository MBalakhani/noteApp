// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasktypeAdapter extends TypeAdapter<Tasktype> {
  @override
  final int typeId = 2;

  @override
  Tasktype read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasktype(
      image: fields[0] as String,
      title: fields[1] as String,
      TasktypeEnum: fields[2] as TaskTypeEnum,
    );
  }

  @override
  void write(BinaryWriter writer, Tasktype obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.TasktypeEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasktypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
