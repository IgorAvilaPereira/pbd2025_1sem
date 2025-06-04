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
[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./trabalhos)
