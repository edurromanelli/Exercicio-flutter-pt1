import 'package:hive_flutter/hive_flutter.dart';
import '../models/fornecedor.dart';

class FornecedorRepository {
  // Nome da "caixa" (tabela) no Hive
  static const String _boxName = 'fornecedorBox';

  // [C]riação: Salvar/Inserir um novo Fornecedor
  // Futuro (Future) e Assíncrono (async/await)
  Future<void> salvarFornecedor(Fornecedor fornecedor) async {
    final box = await Hive.openBox<Fornecedor>(_boxName);
    await box.put(fornecedor.id, fornecedor); // put() insere com a chave ID
    await box.close();
  }

  // [R]eitura: Listar todos os Fornecedores
  Future<List<Fornecedor>> listarTodosFornecedores() async {
    final box = await Hive.openBox<Fornecedor>(_boxName);
    final lista = box.values.toList(); // Retorna todos os objetos como Lista
    await box.close();
    return lista;
  }
}