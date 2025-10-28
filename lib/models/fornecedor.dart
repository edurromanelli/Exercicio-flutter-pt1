import 'package:hive/hive.dart';

// Este 'part' será substituído pelo nome do seu arquivo.dart:
part 'fornecedor.g.dart'; 

@HiveType(typeId: 0) // ID ÚNICO para o Hive
class Fornecedor {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nome; // Ex: NVIDIA, Intel
  @HiveField(2)
  final String contato;
  @HiveField(3)
  final String cnpj;
  @HiveField(4)
  final String site; // 5 atributos

  Fornecedor({
    required this.id,
    required this.nome,
    required this.contato,
    required this.cnpj,
    required this.site,
  });

  // Método de conversão toMap (boa prática, mesmo que o Hive use o adapter)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'contato': contato,
      'cnpj': cnpj,
      'site': site,
    };
  }
}