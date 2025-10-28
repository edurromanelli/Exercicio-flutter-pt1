// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FornecedorAdapter extends TypeAdapter<Fornecedor> {
  @override
  final int typeId = 0;

  @override
  Fornecedor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fornecedor(
      id: fields[0] as int,
      nome: fields[1] as String,
      contato: fields[2] as String,
      cnpj: fields[3] as String,
      site: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Fornecedor obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.contato)
      ..writeByte(3)
      ..write(obj.cnpj)
      ..writeByte(4)
      ..write(obj.site);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FornecedorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
