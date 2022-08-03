// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subbill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubBillAdapter extends TypeAdapter<SubBill> {
  @override
  final int typeId = 0;

  @override
  SubBill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubBill(
      member: fields[0] as Member,
      entries: (fields[1] as List).cast<Entry>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubBill obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.member)
      ..writeByte(1)
      ..write(obj.entries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubBillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
