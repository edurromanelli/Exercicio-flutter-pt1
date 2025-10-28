import 'package:hive_flutter/hive_flutter.dart';
import '../models/produto.dart';

// A classe Repository que isola a lógica do banco de dados da UI [cite: 14]
class ProdutoRepository {
  static const String _boxName = 'produtoBox';

  // [C]riação: Salvar/Inserir um novo Produto
  // Deve ser assíncrono (Future) [cite: 43]
  Future<void> salvarProduto(Produto produto) async { // [cite: 49, 50]
    final box = await Hive.openBox<Produto>(_boxName);
    await box.put(produto.id, produto);
    await box.close();
  }

  // [R]eitura: Listar todos os Produtos
  // Deve ser assíncrono e retornar uma lista [cite: 53, 59]
  Future<List<Produto>> listarTodosProdutos() async {
    final box = await Hive.openBox<Produto>(_boxName);
    final lista = box.values.toList();
    await box.close();
    return lista;
  }
}