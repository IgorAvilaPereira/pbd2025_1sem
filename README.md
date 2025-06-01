# pbd2025_1sem <br>
## [./10_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./10_aula) <br>

```js
 <script>
        async function teste() {
            try {
                const response = await fetch("/teste");
                const data = await response.json();
                console.log(data);
            } catch (error) {
                console.error("Erro ao obter dados:", error);
            }
        }

        /*
        async function enviarDados() {
            const dados = {
                nome: 'Igor',
                idade: 30,
                cidade: 'Rio Grande'
            };

            try {
                const response = await fetch('/api/usuario', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(dados)
                });

                if (!response.ok) {
                    throw new Error('Falha na requisição');
                }

                const resultado = await response.json();
                console.log('Resposta do servidor:', resultado);
            } catch (error) {
                console.error('Erro ao enviar dados:', error);
            }
        }*/

        /*
        https://flask.palletsprojects.com/en/stable/patterns/javascript/
        */

    </script>
```

```python
@app.route("/teste")
def teste():    
    return {
        "username": "igor",
        "email": "igor.pereira@riogrande.ifrs.edu.br"
    }

@app.route("/teste_pagina")
def teste_pagina():    
    return render_template('teste.html')   
```


&nbsp;
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
[lista1_310325.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./5_aula/lista1_310325.sql) <br>
* Terminar [Lista 1 (>=16)](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/2_aula/lista1.md)
* Divulgação TRABALHO 1 -> Data e Peso estão no SIGAA

Semana Quem vem:

* Extras + Atendimento Trabalho

Na volta:

* Aulão de Revisão
* Fazer a atividade avaliada do 1 bim.
* E começar 2º bim: trigger

<!--
***


16. Crie uma stored procedure que aplique um bônus salarial de acordo com a idade.
17. Crie uma function que retorne a quantidade total de funcionários na tabela.
18. Crie uma procedure que atualize o salário de todos os funcionários em 10%.
19. Crie uma function que retorne o maior salário entre todos os funcionários.
20. Crie uma stored procedure que delete todos os funcionários de um determinado departamento.
-->

&nbsp;
## [./6_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./6_aula) <br>
[material_aula.zip](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./6_aula/material_aula.zip) <br>
Extras + Atendimento Trabalho

&nbsp;
## [./7_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./7_aula) <br>
[aula7.sql](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./7_aula/aula7.sql) <br>
[index.py](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./7_aula/index.py) <br>

* [PostgreSQL - Como Programar - DesCOMPlica, Oliba!](https://www.youtube.com/playlist?list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

  * **Stored Procedure:**
   
    * [(Aula 1) - Introdução às Funções e Procedimentos - Função Olá, mundo! (Hello, World)](https://www.youtube.com/watch?v=uV8QKT1oGxA&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 2) - Introdução às Funções Com Parâmetros](https://www.youtube.com/watch?v=ztzTcm7RtcY&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 3) - Parâmetros de Entrada e Saída (IN OUT INOUT)](https://www.youtube.com/watch?v=B0T9YvyxQoU&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 4) - Procedimentos Armazenados e Sobrecarga de Função](https://www.youtube.com/watch?v=rVEfMDOAbzI&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 5) - Comandos Condicionais (IF THEN ELSIF ELSE)](https://www.youtube.com/watch?v=3Rx6chu6lTM&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 6) - Laços de Repetição While (Enquanto)](https://www.youtube.com/watch?v=pXcvN0e6ksg&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 7) - Laços de Repetição FOR (Para)](https://www.youtube.com/watch?v=aLKFqGf7_Vs&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

    * [(Aula 8) - Iterando Tupla por Tupla por Meio de Comandos FOR (Loop PARA)](https://www.youtube.com/watch?v=anAC9R2M0i4&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxu)

    * [(Aula 9) - Arrays (Vetores) em PostgreSQL - Declaração, Atribuição e Exemplos](https://www.youtube.com/watch?v=FFZq_YFqHcY&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN)

  * **Triggers:**

     * [(Aula 10) - Triggers (Gatilhos) em Detalhes em PostgreSQL - Com Exemplos e Implementação](https://www.youtube.com/watch?v=f-gTevkp7sg&list=PLHCyLhqWSaHDHOCJycIf4FHSU6-IMCxuN&index=29)
[trigger.pdf](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./7_aula/trigger.pdf) <br>
## [./8_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./8_aula) <br>
### Triggers

* INSTEAD OF: "em vez de...  "
* for each row: eventos executados por linha
* for each statement: eventos serão executados como uma grande transação única

### Playlists Python/Flask/Psycopg

* [Todos os vídeos](https://youtube.com/playlist?list=PLvT8P1q6jMWeVihLzRF3Do1gfGKL8xOtZ)

* [Psycopg](https://youtube.com/playlist?list=PLvT8P1q6jMWc0e1WirbTG-2dWkzbrF4lV)

* [Psycopg + Flask](https://youtube.com/playlist?list=PLvT8P1q6jMWdfi2Od79tZ2zLdS5DTiwVU)

* [Orientação a Objetos com Python (Modo Express)](https://youtube.com/playlist?list=PLvT8P1q6jMWfibTv2uxyDSrMCmjxhXcRz)

* [Trabalhando com Arquivo de Texto em Python](https://youtube.com/playlist?list=PLvT8P1q6jMWdw_9EW4JK36NUDqz4U-uKt)

* [Flask-SQLAlchemy](https://youtube.com/playlist?list=PLvT8P1q6jMWfU2XuNBcA-81TE-CaBEM4n)

* [Flask-Extensions](https://youtube.com/playlist?list=PLvT8P1q6jMWe2c2T0R3RthPyQELWWJtcz)

* [Python/Tkinter](https://youtube.com/playlist?list=PLvT8P1q6jMWfdjqCvnHsTCKxofVBNBZyD)


[materiais](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./8_aula/materiais) <br>
[projeto](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./8_aula/projeto) <br>
## [./9_aula](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./9_aula) <br>
[crongrama.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./9_aula/crongrama.md) <br>
[lista_trigger_and_functions.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./9_aula/lista_trigger_and_functions.md) <br>
[projeto.zip](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./9_aula/projeto.zip) <br>
* Continuar lista
* [Trabalho 2](https://github.com/IgorAvilaPereira/pbd2025_1sem/wiki#trabalho-2)

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
### Trabalho 2

## 🧾 Projeto: **Sistema Web de Gestão de Pedidos para Restaurante**



### 🔧 Tecnologias Utilizadas:

* **Python Flask**: Backend da aplicação.
* **psycopg**: Integração com PostgreSQL.
* **PostgreSQL**: Banco de dados com lógica em stored procedures, funções e triggers.
* **Jinja2**: Templates HTML dinâmicos.

---

### 🎯 Objetivo:

Construir uma aplicação web para gestão de pedidos de um restaurante, onde o backend serve páginas HTML renderizadas com Jinja2, e toda a lógica de negócios, controle de fluxo e consistência de dados é feita diretamente no banco de dados com funções, stored procedures e triggers.

---

### 🧩 Componentes do Projeto:

#### 1. **Frontend com Jinja2 Templates**

Todas as páginas são renderizadas no servidor:

* `cardapio.html`
* `novo_pedido.html`
* `painel_admin.html`
* `detalhes_pedido.html`

```html
{% for pedido in pedidos %}
  <tr>
    <td>{{ pedido.id }}</td>
    <td>{{ pedido.cliente_nome }}</td>
    <td>{{ pedido.status }}</td>
  </tr>
{% endfor %}
```

---

### 🗃️ Estrutura do Banco de Dados

#### **Tabelas:**

* `usuarios`
* `itens_cardapio`
* `pedidos`
* `itens_pedido`
* `estoque`
* `logs`
* `status_pedido`

---

### ⚙️ Funções e Stored Procedures

#### ✅ `registrar_pedido(cliente_id, itens[])`

Cria um novo pedido com múltiplos itens. Valida estoque e grava o total.

#### ✅ `calcular_total_pedido(pedido_id)`

Retorna a soma do valor dos itens de um pedido.

#### ✅ `listar_pedidos(status TEXT)`

Retorna todos os pedidos com o status informado (ex: ‘em preparo’).

#### ✅ `trocar_status_pedido(pedido_id, novo_status)`

Altera o status de um pedido validando as transições permitidas.

---

### ⚡ Triggers e Funções de Apoio

### 🔹 1. **Trigger: `trg_log_alteracao`**

**Função:** `log_alteracao_pedido()`

* **Objetivo:** Registrar automaticamente qualquer atualização feita na tabela `pedidos`, como mudança de status, alteração no total ou horário de entrega.
* **Por que é útil:** Cria uma trilha de auditoria no sistema sem depender do backend.
* **Onde grava:** Tabela `logs(pedido_id, acao, data_hora)`

📌 *Exemplo de log gerado:*

> Pedido 103 atualizado para “em preparo” em 2025-05-26 14:03:17.

---

### 🔹 2. **Trigger: `trg_validar_estoque`**

**Função:** `validar_estoque()`

* **Objetivo:** Impedir a inserção de um item em um pedido se não houver estoque suficiente.
* **Quando é executada:** Antes de um novo `item_pedido` ser inserido.
* **Comportamento:** Se a quantidade solicitada for maior que o disponível no estoque, lança um erro e cancela a operação.

📌 *Mensagem de erro possível:*

> Estoque insuficiente para o item 45 (Pizza Calabresa).

---

### 🔹 3. **Trigger: `trg_descontar_estoque`**

**Função:** `descontar_estoque()`

* **Objetivo:** Subtrair automaticamente do estoque a quantidade de cada item após ser adicionado a um pedido.
* **Importância:** Garante que o estoque esteja sempre sincronizado com as vendas.
* **Execução:** Após a inserção de cada linha em `itens_pedido`.

🛠️ *Complementar à trigger de validação.* Primeiro valida, depois atualiza.

---

### 🔹 4. **Trigger: `trg_validar_status`**

**Função:** `validar_transicao_status()`

* **Objetivo:** Impedir alterações inválidas no status de pedidos.
* **Regras Exemplo:**

  * Um pedido "entregue" não pode voltar para "em preparo".
  * Um pedido "cancelado" não pode ser reativado.
* **Mensagem de erro:**

  > Não é possível alterar um pedido já entregue.

🔐 *Ajuda a evitar erros humanos ou falhas no frontend.*

---

### 🔹 5. **Trigger: `trg_log_cancelamento`**

**Função:** `log_cancelamento()`

* **Objetivo:** Gravar um log específico sempre que um pedido for cancelado.
* **Execução:** Após a mudança de status para `cancelado`.
* **Comportamento adicional:** Pode ser estendida para notificar a cozinha ou o cliente, via webhook.

📌 *Exemplo de log gerado:*

> Pedido 201 cancelado em 2025-05-26 15:04:20.

---

### 🧪 Fluxo do Sistema:

1. O cliente acessa o sistema via interface web.
2. Escolhe itens do cardápio e registra um novo pedido.
3. O backend chama a **stored procedure** que cria o pedido, valida estoque e atualiza tudo via triggers.
4. Toda alteração em pedidos gera logs e garante consistência via triggers (estoque, status, logs).
5. O administrador visualiza pedidos e atualiza status diretamente, com a lógica de transição controlada por **funções e triggers**.

***

### Trabalho 1

Projeto de Modelagem de Banco de Dados e Implementação de Stored Procedures em PL/pgSQL

**Objetivo:**

Desenvolver um banco de dados relacional utilizando PostgreSQL, incluindo a criação de stored procedures e functions em PL/pgSQL para manipulação de dados.

**Tarefas:**

**Modelagem do Banco de Dados:**

* Construir o modelo relacional (.dia) para um sistema de gerenciamento de biblioteca.

* Criar o script.sql (tabelas) para armazenar informações sobre livros,  exemplares, autores, membros, empréstimos e/ou devoluções.
    * Autores tem um código e um nome
    * Livros tem um título e um autor relacionado (neste caso somente um autor). Um ator pode escrever vários livros
    * A biblioteca pode ter diversos exemplares de um mesmo livro. 
    * Membros tem código, nome e data de nascimento
    * Membros realizam empréstimos e devoluções de exemplares com data de e data de devolução. No caso de entregas com multas, a multa tem que ser armazenada

obs: lembrando que o empréstimo são de exemplares. Um livro tem vários exemplares.
    

**Criação do Banco de Dados:**

* Escrever scripts SQL para criar as tabelas.
* Inserir dados de exemplo nas tabelas para testes.

**Stored Procedures e Functions:**

1) Criar uma stored procedure para registrar um novo empréstimo de livro.

2) Criar uma stored procedure para registrar uma devolução de livro: Criar uma stored procedure que registre a devolução de um livro, atualizando o status do livro e calculando a multa por atraso se houver.

* Parâmetros: id_livro, id_membro, data_devolucao    
* Retorno: mensagem (mensagem de sucesso ou erro)
    
3) Criar uma function para calcular a multa por atraso na devolução de um livro. Obs: R$ 1,50 por cada dia de atraso. Criar uma function que calcule a taxa de empréstimo de livro com base no tempo de empréstimo e no tipo de livro.

* Parâmetros: id_livro, data_emprestimo, data_devolucao <!--, tipo_livro-->
* Retorno: taxa_emprestimo (valor da taxa de empréstimo)
    
4) Implementar uma stored procedure para registrar uma renovação de empréstimo
Criar uma stored procedure que registre a renovação de um empréstimo de livro, atualizando o status do livro e calculando a nova data de devolução.

* Parâmetros: id_livro, id_membro, data_renovação
* Retorno: mensagem (mensagem de sucesso ou erro)
    
5) Implementar uma stored procedure para atualizar as informações de um membro.
* Criar uma function para calcular a estatística de empréstimos por membro
Criar uma function que calcule a estatística de empréstimos por membro, incluindo o número de empréstimos feitos, o número de devoluções feitas e a taxa de devolução.

* Parâmetros: id_membro
* Retorno: valor real 
    
6) Implementar uma stored procedure para excluir um livro do catálogo. Criar uma stored procedure que exclua um livro do catálogo, atualizando a tabela de livros e removendo qualquer registro de empréstimo ou devolução relacionado ao livro. PS: não esquecer dos exemplares.

 * Parâmetros: id_livro
 * Retorno: mensagem (mensagem de sucesso ou erro)
     
7) Criar uma function para calcular a disponibilidade de livros em estoque. Criar uma function que calcule a disponibilidade de livros em estoque, considerando a quantidade de livros em estoque e a quantidade de livros emprestados.

* Parâmetros: id_livro
* Retorno: disponibilidade (quantidade de livros disponíveis)

8) Implementar uma stored procedure para atualizar as informações de um livro
Criar uma stored procedure que atualize as informações de um livro, incluindo o título, autor, editora, etc.

* Parâmetros: id_livro, titulo, autor, editora, etc.
* Retorno: mensagem (mensagem de sucesso ou erro)

9) Criar uma function para calcular a estatística de devoluções por tipo de livro.
Criar uma function que calcule a estatística de devoluções por tipo de livro, incluindo o número de devoluções feitas e a taxa de devolução.

* Parâmetros: id_tipo_livro
* Retorno: valor real 

10) Realizar operações de inserção, atualização e exclusão utilizando as stored procedures. Escrever queries para testar as stored procedures e functions criadas.

**Valor: 5**

&nbsp;
## [./videos](https://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./videos) <br>
[videos.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/./videos/videos.md) <br>
