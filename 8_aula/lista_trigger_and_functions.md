Com certeza! Com base na estrutura do seu banco de dados `aula7`, preparei 10 exercícios que envolvem a criação e utilização de functions e triggers. Estes exercícios visam cobrir diferentes aspectos dessas funcionalidades no PostgreSQL.

**Exercícios com Functions:**

1.  **Função para Obter o Nome do Médico:** Crie uma função chamada `obter_nome_medico` que recebe o `id` de um médico como parâmetro e retorna o seu nome.

2.  **Função para Contar Consultas por Paciente:** Desenvolva uma função chamada `contar_consultas_paciente` que recebe o `id` de um paciente e retorna o número total de consultas agendadas para ele.

3.  **Função para Formatar Data de Nascimento:** Crie uma função chamada `formatar_data_nascimento` que recebe a data de nascimento de um paciente e retorna essa data no formato 'DD/MM/AAAA'.

4.  **Função para Verificar se um CRM Existe:** Elabore uma função booleana chamada `crm_existe` que recebe um número de CRM e retorna `TRUE` se existir um médico com esse CRM na tabela `medico`, e `FALSE` caso contrário.

5.  **Função para Listar Pacientes Nascidos em um Determinado Ano:** Crie uma função chamada `listar_pacientes_ano` que recebe um ano como parâmetro e retorna uma tabela contendo o nome e o CPF de todos os pacientes que nasceram naquele ano.

**Exercícios com Triggers:**

6.  **Trigger para Registrar Novo Médico no Log:** Crie um trigger que seja disparado sempre que um novo médico for inserido na tabela `medico`. Este trigger deve inserir na tabela `consulta_log` a data e hora da inserção e o nome do médico adicionado.

7.  **Trigger para Impedir Agendamento em Finais de Semana:** Desenvolva um trigger que impeça a inserção de novas consultas na tabela `consulta` caso a `data_hora` da consulta caia em um sábado ou domingo.

8.  **Trigger para Atualizar Log ao Excluir Consulta:** Crie um trigger que seja disparado antes da exclusão de uma consulta na tabela `consulta`. Este trigger deve inserir na tabela `consulta_log` a data e hora da tentativa de exclusão e o nome do médico associado à consulta que está sendo excluída.

9.  **Trigger para Garantir CRM em Maiúsculo:** Elabore um trigger que, antes da inserção ou atualização de um registro na tabela `medico`, converta o valor do campo `crm` para letras maiúsculas.

10. **Trigger para Limitar o Número de Consultas por Dia por Médico:** Crie um trigger que impeça a inserção de uma nova consulta para um determinado médico se ele já tiver agendado mais de 5 consultas na mesma data.

11. **Trigger para Auditoria da Tabela Paciente:** Crie uma tabela chamada `paciente_audit` com as colunas `id_audit serial primary key`, `operacao character varying(10) not null`, `data_hora timestamp default current_timestamp`, `usuario text`, e as mesmas colunas da tabela `paciente`. Desenvolva um trigger que seja disparado após cada operação de `INSERT`, `UPDATE` ou `DELETE` na tabela `paciente`, inserindo um novo registro na tabela `paciente_audit` detalhando a operação, a data e hora, um nome de usuário fixo ('sistema'), e os dados do paciente antes da modificação (para `DELETE` e `UPDATE`) ou depois da modificação (para `INSERT` e `UPDATE`).

12. **Trigger para Manter um Histórico de Observações da Consulta:** Crie uma tabela chamada `consulta_historico_observacoes` com as colunas `id serial primary key`, `consulta_id integer references consulta (id)`, `data_hora timestamp default current_timestamp`, e `observacao text`. Desenvolva um trigger que seja disparado sempre que a coluna `observacao` da tabela `consulta` for atualizada. Este trigger deve inserir um novo registro na tabela `consulta_historico_observacoes` com o `id` da consulta, a data e hora da alteração e a nova observação.

13. **Trigger para Enviar Notificação por E-mail (Simulado):** Embora o PostgreSQL não envie e-mails diretamente, podemos simular esse comportamento com um trigger. Crie uma tabela chamada `notificacoes_pendentes` com as colunas `id serial primary key`, `destinatario text not null`, `assunto text not null`, `mensagem text not null`, e `data_criacao timestamp default current_timestamp`. Desenvolva um trigger que seja disparado após a inserção de um novo paciente na tabela `paciente`. Este trigger deve inserir um registro na tabela `notificacoes_pendentes` com um e-mail de boas-vindas para o novo paciente.

14. **Trigger para Calcular a Idade do Paciente (Coluna Virtual):** Crie uma função chamada `calcular_idade` que recebe a data de nascimento e retorna a idade em anos. Em seguida, crie uma VIEW chamada `vw_pacientes_idade` que inclua todas as colunas da tabela `paciente` e adicione uma coluna chamada `idade` que seja calculada utilizando a função `calcular_idade` com a `data_nascimento`. Embora este não seja um trigger tradicional que modifica dados, ele demonstra como podemos usar functions para criar informações dinâmicas baseadas nos dados da tabela.

15. **Trigger para Impedir CPF Duplicado (Tratamento de Erro Personalizado):** Embora a constraint `UNIQUE` já impeça CPFs duplicados, podemos criar um trigger `BEFORE INSERT OR UPDATE` na tabela `paciente` que verifique se o CPF já existe. Se existir, em vez de gerar um erro padrão do banco de dados, o trigger pode usar a função `RAISE EXCEPTION` para retornar uma mensagem de erro mais amigável e específica para o usuário.

Estes exercícios exploram auditoria de dados, histórico de alterações, simulação de ações externas e tratamento personalizado de erros. Espero que sejam desafiadores e educativos! Se precisar de mais algum exercício ou ajuda com a implementação, me diga. 😊