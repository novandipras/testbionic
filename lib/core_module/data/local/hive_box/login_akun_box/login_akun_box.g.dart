// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_akun_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginAkunBoxAdapter extends TypeAdapter<LoginAkunBox> {
  @override
  final int typeId = 0;

  @override
  LoginAkunBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginAkunBox(
      loginAkun: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, LoginAkunBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.loginAkun);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginAkunBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
