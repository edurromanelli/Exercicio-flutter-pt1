# 💻 Avaliação Processual - Parte 1: Camada de Dados e Persistência

**Disciplina:** Computação Móvel
**Professor:** Edgard da Cunha Pontes
**Data de Entrega:** 28/10/2025

---

## 1. Objetivo do Projeto

[cite_start]O foco desta primeira parte foi migrar a aplicação, que representa um e-commerce de hardware, para uma solução com **persitência de dados local**[cite: 273]. [cite_start]A implementação utilizou o **Padrão Repository** para isolar a lógica de acesso ao banco de dados da interface do usuário (UI)[cite: 273].

[cite_start]Os conceitos (entidades) modelados para o trabalho foram: **`Produto`** e **`Fornecedor`**[cite: 288].

## 2. Modelagem e Configuração da Camada de Dados

### [cite_start]2.1 Estrutura de Pastas e Bibliotecas [cite: 324]

O código foi organizado nas pastas `models/` e `repositories/`.

* **Biblioteca de Persistência Escolhida:** **Hive** (escolhido por ser um banco de dados NoSQL leve, eficiente e de fácil configuração no Flutter).
* [cite_start]**Inicialização:** A conexão do banco de dados foi configurada e aberta na função `main()` [cite: 300][cite_start], onde também foram registrados os Adapters para a conversão dos objetos[cite: 299].

### 2.2 Classes Modelo (`models/`)

[cite_start]Cada classe contém 5 atributos, conforme o requisito do projeto[cite: 292].

| Conceito | Atributos Principais (5) | Propósito |
| :--- | :--- | :--- |
| [cite_start]**`Fornecedor`** | id, nome, contato, cnpj, site [cite: 275] | Representa a fabricante/marca do hardware. |
| [cite_start]**`Produto`** | id, nome, preco, descricao, idFornecedor [cite: 275] | Representa o item de hardware. |

## 3. Implementação do Padrão Repository (CRUD)

### [cite_start]3.1 Lógica do Repositório [cite: 301, 331]

O Padrão Repository garante que a UI use apenas objetos Dart, enquanto o repositório (ex: `ProdutoRepository`) encapsula toda a lógica assíncrona de acesso ao Hive.

* [cite_start]**Assincronicidade:** Todos os métodos de persistência utilizam **`Future`**, **`async`** e **`await`**, conforme exigido[cite: 326, 335].
* [cite_start]**Conversão:** Os objetos são convertidos via **Hive Adapters** na inserção e na leitura (para retornar uma lista de objetos Dart)[cite: 351, 354].

### 3.2 Métodos Implementados (CRUD - Criação e Leitura)

| Conceito | Operação | Assinatura |
| :--- | :--- | :--- |
| **`Produto`** | [cite_start]**C**riação (C) [cite: 304] | [cite_start]`Future<void> salvarProduto(Produto produto)` [cite: 309] |
| **`Fornecedor`** | [cite_start]**C**riação (C) [cite: 304] | [cite_start]`Future<void> salvarFornecedor(Fornecedor fornecedor)` [cite: 309] |
| **`Produto`** | [cite_start]**L**eitura (R) [cite: 312] | [cite_start]`Future<List<Produto>> listarTodosProdutos()` [cite: 318] |
| **`Fornecedor`** | [cite_start]**L**eitura (R) [cite: 312] | [cite_start]`Future<List<Fornecedor>> listarTodosFornecedores()` [cite: 318] |

## 4. Teste de Lógica e Persistência (Console)

[cite_start]O teste foi realizado na função `main()`, onde os dados foram inseridos (`salvar...`) e lidos (`listarTodos...`) para comprovar a persistência, conforme o Requisito 4[cite: 320, 321].

**Comprovação da Saída no Console (Resultado do Teste):**
