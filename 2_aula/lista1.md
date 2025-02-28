# Lista 1

### Base de Dados

Vamos supor que temos uma tabela chamada `funcionarios` com a seguinte estrutura:
```sql
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    departamento VARCHAR(50),
    salario DECIMAL(10, 2)
);
```

### Exercícios

#### 1. Crie uma stored procedure para inserir um novo funcionário na tabela `funcionarios`.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE inserir_funcionario(
    p_nome VARCHAR,
    p_idade INT,
    p_departamento VARCHAR,
    p_salario DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO funcionarios (nome, idade, departamento, salario)
    VALUES (p_nome, p_idade, p_departamento, p_salario);
END;
$$;
```
-->

#### 2. Crie uma function que retorne o nome de um funcionário com base em seu ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION obter_nome_funcionario(p_id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_nome VARCHAR;
BEGIN
    SELECT nome INTO v_nome FROM funcionarios WHERE id = p_id;
    RETURN v_nome;
END;
$$;
```
-->

#### 3. Crie uma procedure que aumente o salário de um funcionário em 10% com base no ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE aumentar_salario(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET salario = salario * 1.10
    WHERE id = p_id;
END;
$$;
```
-->

#### 4. Crie uma stored procedure que delete um funcionário com base no ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE deletar_funcionario(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM funcionarios WHERE id = p_id;
END;
$$;
```
-->

#### 5. Crie uma function que retorne a média salarial de um departamento específico.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION media_salarial_departamento(p_departamento VARCHAR)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_media DECIMAL;
BEGIN
    SELECT AVG(salario) INTO v_media FROM funcionarios WHERE departamento = p_departamento;
    RETURN v_media;
END;
$$;
```
-->

#### 6. Crie uma procedure que atualize o departamento de um funcionário.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE atualizar_departamento(p_id INT, p_departamento VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET departamento = p_departamento
    WHERE id = p_id;
END;
$$;
```
-->

#### 7. Crie uma function que retorne a quantidade de funcionários em um determinado departamento.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION contar_funcionarios_departamento(p_departamento VARCHAR)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_contagem INT;
BEGIN
    SELECT COUNT(*) INTO v_contagem FROM funcionarios WHERE departamento = p_departamento;
    RETURN v_contagem;
END;
$$;
```
-->

#### 8. Crie uma procedure que diminua o salário de um funcionário em 5% com base no ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE diminuir_salario(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET salario = salario * 0.95
    WHERE id = p_id;
END;
$$;
```
-->

#### 9. Crie uma function que retorne a soma dos salários de todos os funcionários.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION soma_salarios()
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_soma DECIMAL;
BEGIN
    SELECT SUM(salario) INTO v_soma FROM funcionarios;
    RETURN v_soma;
END;
$$;
```
-->

#### 10. Crie uma stored procedure que liste todos os funcionários de um determinado departamento.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE listar_funcionarios_departamento(p_departamento VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT * FROM funcionarios WHERE departamento = p_departamento;
END;
$$;
```
-->

#### 11. Crie uma function que verifique se um funcionário existe na tabela com base no ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION verificar_funcionario(p_id INT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    v_existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM funcionarios WHERE id = p_id) INTO v_existe;
    RETURN v_existe;
END;
$$;
```
-->

#### 12. Crie uma procedure que mude o nome de um funcionário com base no ID.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE mudar_nome_funcionario(p_id INT, p_nome VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET nome = p_nome
    WHERE id = p_id;
END;
$$;
```
-->

#### 13. Crie uma function que retorne a idade média dos funcionários.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION idade_media_funcionarios()
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_media DECIMAL;
BEGIN
    SELECT AVG(idade) INTO v_media FROM funcionarios;
    RETURN v_media;
END;
$$;
```
-->

#### 14. Crie uma procedure que insira vários funcionários de uma vez.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE inserir_varios_funcionarios(p_funcionarios JSON)
LANGUAGE plpgsql
AS $$
DECLARE
    p_record JSON;
BEGIN
    FOR p_record IN SELECT * FROM json_array_elements(p_funcionarios) LOOP
        INSERT INTO funcionarios (nome, idade, departamento, salario)
        VALUES (p_record->>'nome', (p_record->>'idade')::INT, p_record->>'departamento', (p_record->>'salario')::DECIMAL);
    END LOOP;
END;
$$;
```
-->

#### 15. Crie uma function que retorne o nome do funcionário mais jovem.


<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION funcionario_mais_jovem()
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_nome VARCHAR;
BEGIN
    SELECT nome INTO v_nome FROM funcionarios ORDER BY idade ASC LIMIT 1;
    RETURN v_nome;
END;
$$;
```
-->

#### 16. Crie uma stored procedure que aplique um bônus salarial de acordo com a idade.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE aplicar_bonus_idade()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET salario = salario + 1000
    WHERE idade > 50;
END;
$$;
```
-->

#### 17. Crie uma function que retorne a quantidade total de funcionários na tabela.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION total_funcionarios()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_total INT;
BEGIN
    SELECT COUNT(*) INTO v_total FROM funcionarios;
    RETURN v_total;
END;
$$;
```
-->

#### 18. Crie uma procedure que atualize o salário de todos os funcionários em 10%.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE atualizar_todos_salarios()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE funcionarios
    SET salario = salario * 1.10;
END;
$$;
```
-->

#### 19. Crie uma function que retorne o maior salário entre todos os funcionários.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE FUNCTION maior_salario()
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_maior DECIMAL;
BEGIN
    SELECT MAX(salario) INTO v_maior FROM funcionarios;
    RETURN v_maior;
END;
$$;
```
-->

#### 20. Crie uma stored procedure que delete todos os funcionários de um determinado departamento.

<!--
- **Resposta:**
```sql
CREATE OR REPLACE PROCEDURE deletar_funcionarios_departamento(p_departamento VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM funcionarios WHERE departamento = p_departamento;
END;
$$;
```
-->

