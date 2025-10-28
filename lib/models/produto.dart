import 'package:hive/hive.dart';

// O nome do arquivo gerado deve ser exatamente este:
part 'produto.g.dart'; 

@HiveType(typeId: 1) // Garanta que o ID seja único (0 foi usado pelo Fornecedor)
class Produto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nome; 
  @HiveField(2)
  final double preco;
  @HiveField(3)
  final String descricao;
  @HiveField(4)
  final int idFornecedor; // 5 atributos no total

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.idFornecedor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'descricao': descricao,
      'idFornecedor': idFornecedor,
    };
  }
}