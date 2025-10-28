// lib/main.dart

import 'package:flutter/material.dart';
// Importa o novo arquivo que contém toda a lógica do Hive
import 'data_initializer.dart'; 


void main() async {
  // 1. Inicializa o Hive e os Adapters no arquivo de inicialização
  await inicializarHive();
  
  // 2. Chama o teste de persistência
  await testarPersistencia();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Verifique o console para os resultados do teste de persistência!'),
        ),
      ),
    );
  }
}