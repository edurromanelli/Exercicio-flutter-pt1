// lib/data_initializer.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Importa os modelos e repositórios
import 'repositories/fornecedor_repository.dart';
import 'repositories/produto_repository.dart';

// USANDO SHOW: 
// Isso importa o arquivo 'fornecedor.dart' e diz ao Dart
// para que ele EXIBIR APENAS o Fornecedor e o Adapter (que é a classe gerada no .g.dart)
import 'models/fornecedor.dart' show Fornecedor, FornecedorAdapter;
import 'models/produto.dart' show Produto, ProdutoAdapter;


// --- FUNÇÃO DE INICIALIZAÇÃO DO HIVE ---
// Esta função configura o banco e registra os Adapters.
Future<void> inicializarHive() async {
  // Configuração obrigatória do Flutter e Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 

  // O registro dos Adapters funciona porque eles foram expostos pelo 'show'
  Hive.registerAdapter(FornecedorAdapter()); 
  Hive.registerAdapter(ProdutoAdapter());
}

// --- FUNÇÃO DE TESTE (CRIAR E LER) ---
Future<void> testarPersistencia() async {
  print('\n--- INICIANDO TESTE DE PERSISTÊNCIA (CRIAR E LER) ---');

  final prodRepo = ProdutoRepository();
  final fornRepo = FornecedorRepository();
  
  // Limpar dados anteriores para o teste ser sempre limpo (OPCIONAL)
  await Hive.deleteBoxFromDisk('fornecedorBox');
  await Hive.deleteBoxFromDisk('produtoBox');


  // --- 1. CRIAR DADOS (C) ---
  print('1. Inserindo Fornecedores e Produtos...');
  
  final forn1 = Fornecedor(
    id: 1, 
    nome: 'NVIDIA', 
    contato: 'contato@nvidia.com', 
    cnpj: '00.111.222/0001-33', 
    site: 'nvidia.com'
  );
  await fornRepo.salvarFornecedor(forn1); 

  final prod1 = Produto(
    id: 101, 
    nome: 'GeForce RTX 4070', 
    preco: 4500.00, 
    descricao: 'Placa de vídeo de 12GB GDDR6X', 
    idFornecedor: 1
  );
  await prodRepo.salvarProduto(prod1);


  // --- 2. LER TODOS OS DADOS (R) ---
  print('\n2. LENDO DADOS INSERIDOS E CONFIRMANDO PERSISTÊNCIA:');
  
  final todosProdutos = await prodRepo.listarTodosProdutos();
  final todosFornecedores = await fornRepo.listarTodosFornecedores();

  // Imprimir Produtos
  print('--- PRODUTOS ENCONTRADOS ---');
  for (var p in todosProdutos) {
    print('ID: ${p.id} | Nome: ${p.nome} | Preço: R\$ ${p.preco} | Fornecedor ID: ${p.idFornecedor}');
  }

  // Imprimir Fornecedores
  print('\n--- FORNECEDORES ENCONTRADOS ---');
  for (var f in todosFornecedores) {
    print('ID: ${f.id} | Nome: ${f.nome} | CNPJ: ${f.cnpj}');
  }

  print('\n--- TESTE DE CAMADA DE DADOS CONCLUÍDO ---\n');
}