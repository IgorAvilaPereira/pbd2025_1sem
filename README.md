# pbd2025_1sem <br>
## [./1_introducao](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./1_introducao) <br>
[introducao.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./1_introducao/introducao.md) <br>
[stored_procedure.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./1_introducao/stored_procedure.pdf) <br>
[teste.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./1_introducao/teste.sql) <br>
## [./2_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./2_aula) <br>
[lista1_240325.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./2_aula/lista1_240325.sql) <br>
[lista1.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./2_aula/lista1.md) <br>
[lista1.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./2_aula/lista1.sql) <br>
&nbsp; 
[setup.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./2_aula/setup.md) <br>
[david_carnaval](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./2_aula/david_carnaval) <br>
## [./3_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./3_aula) <br>
[lista1_170325.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./3_aula/lista1_170325.sql) <br>
* continuar lista 1
[javalin_mustache_exemplo](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./3_aula/javalin_mustache_exemplo) <br>
## [./4_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./4_aula) <br>
[lista1_240324.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./4_aula/lista1_240324.sql) <br>
Fazer exercícios lista 1 (do 10 em diante)
## [./5_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./5_aula) <br>
* Terminar a lista
* 
* Divulgação TRABALHO 1 -> Data e Peso estão no SIGAA

Na volta:

* Aulão de Revisão
* fazer a atividade avaliada do 1 bim.
* E começar 2º bim: trigger

***

<!--
16. Crie uma stored procedure que aplique um bônus salarial de acordo com a idade.
17. Crie uma function que retorne a quantidade total de funcionários na tabela.
18. Crie uma procedure que atualize o salário de todos os funcionários em 10%.
19. Crie uma function que retorne o maior salário entre todos os funcionários.
20. Crie uma stored procedure que delete todos os funcionários de um determinado departamento.
-->

&nbsp;
## [./dicas](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./dicas) <br>
[dicas.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./dicas/dicas.md) <br>
[temp_table.png](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./dicas/temp_table.png) <br>
## [./slides_importantes](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./slides_importantes) <br>
[introducao-er.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/introducao-er.pdf) <br>
[psql.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/psql.pdf) <br>
[sql1.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/sql1.pdf) <br>
[sql2.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/sql2.pdf) <br>
[stored_procedure.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/stored_procedure.pdf) <br>
[transformacao-er-modelo-relacional.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/transformacao-er-modelo-relacional.pdf) <br>
[trigger.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./slides_importantes/trigger.pdf) <br>
## [./trabalhos](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./trabalhos) <br>

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
## [./videos](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./videos) <br>
[videos.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./videos/videos.md) <br>
