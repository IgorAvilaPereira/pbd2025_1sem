
# Trabalho 1

Projeto de Modelagem de Banco de Dados e Implementação de Stored Procedures em PL/pgSQL

## Objetivo: 

Desenvolver um banco de dados relacional utilizando PostgreSQL, incluindo a criação de stored procedures e functions em PL/pgSQL para manipulação de dados.

## Tarefas:

### Modelagem do Banco de Dados:

* Construir o modelo relacional (.dia) para um sistema de gerenciamento de biblioteca.

* Criar o script.sql (tabelas) para armazenar informações sobre livros,  exemplares, autores, membros, empréstimos e/ou devoluções.
    * Autores tem um código e um nome
    * Livros tem um título e um autor relacionado (neste caso somente um autor). Um ator pode escrever vários livros
    * A biblioteca pode ter diversos exemplares de um mesmo livro. 
    * Membros tem código, nome e data de nascimento
    * Membros realizam empréstimos e devoluções de exemplares com data de e data de devolução. No caso de entregas com multas, a multa tem que ser armazenada

obs: lembrando que o empréstimo são de exemplares. Um livro tem vários exemplares.
    

### Criação do Banco de Dados:

* Escrever scripts SQL para criar as tabelas.
* Inserir dados de exemplo nas tabelas para testes.

### Stored Procedures e Functions:

* Criar uma stored procedure para registrar um novo empréstimo de livro.
* Criar uma function para calcular a multa por atraso na devolução de um livro. Obs: R$ 1,50 por cada dia de atraso.
* Implementar uma stored procedure para atualizar as informações de um membro.
* Escrever queries para testar as stored procedures e functions criadas.
* Realizar operações de inserção, atualização e exclusão utilizando as stored procedures.


## Valor: 5

&nbsp;
