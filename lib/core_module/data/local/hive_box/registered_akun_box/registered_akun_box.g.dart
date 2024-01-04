// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_akun_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisteredAkunBoxAdapter extends TypeAdapter<RegisteredAkunBox> {
  @override
  final int typeId = 1;

  @override
  RegisteredAkunBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegisteredAkunBox(
      listAkun: (fields[0] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, RegisteredAkunBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.listAkun);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisteredAkunBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
