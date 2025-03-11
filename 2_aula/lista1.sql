-- DROP DATABASE IF EXISTS david_carnaval;

-- CREATE DATABASE david_carnaval;

-- \c david_carnaval;

-- CREATE TABLE funcionarios (
--     id SERIAL PRIMARY KEY,
--     nome VARCHAR(100),
--     data_nascimento date,
--     departamento VARCHAR(50),
--     salario numeric(10, 2)
-- );


-- Crie uma stored procedure para inserir um novo funcionário na tabela funcionarios.
CREATE OR REPLACE PROCEDURE 
	inserir_funcionario (nome_aux varchar(100), 
						 data_nascimento_aux date, 
						 departamento_aux varchar(50), 
						 salario_aux numeric(10,2)) AS
$$
BEGIN	
	BEGIN
		INSERT INTO funcionarios(nome, data_nascimento, departamento, salario) VALUES
		(nome_aux, data_nascimento_aux, departamento_aux, salario_aux);
		RAISE NOTICE 'SUPIMPA!';
	EXCEPTION
		WHEN OTHERS THEN RAISE NOTICE 'DEU XABUM!';
	END;
END;
$$ LANGUAGE 'plpgsql';


CALL inserir_funcionario('David', '2003-04-28', 'Carnaval', 1.99);

-- 2. Crie uma function que retorne o nome de um funcionário com base em seu ID.
CREATE OR REPLACE FUNCTION retorne_funcionario(id_aux bigint) RETURNS varchar(100) AS
$$
DECLARE 
	nome_aux varchar(100);
BEGIN
	SELECT nome FROM funcionarios WHERE id = id_aux INTO nome_aux;
	IF NOT FOUND THEN
		RAISE EXCEPTION 'NAO EXISTE FUNCIONARIO COM ESTE id! %', id_aux;
	ELSE 
		RETURN nome_aux;
	END IF;
END;
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION retorne_funcionario2(id_parametro bigint, OUT id_aux bigint, OUT nome_aux varchar(100)) AS
$$
BEGIN
	SELECT nome, id FROM funcionarios WHERE id = id_parametro INTO nome_aux, id_aux;
	IF NOT FOUND THEN
		RAISE EXCEPTION 'NAO EXISTE FUNCIONARIO COM ESTE id! %', id_parametro;
	END IF;
END;
$$ LANGUAGE 'plpgsql';


DROP FUNCTION retorne_funcionario3;
CREATE OR REPLACE FUNCTION retorne_funcionario3(id_param bigint) RETURNS TABLE(id_aux int, nome_aux varchar(100)) AS
$$
DECLARE 
	nome_aux varchar(100);
BEGIN
	RETURN QUERY SELECT id, nome FROM funcionarios WHERE id = id_param;
END;
$$ LANGUAGE 'plpgsql';



select * from retorne_funcionario3(1) where id_aux = 1;


CREATE PROCEDURE aumentar_salario(id_param bigint) AS
$$
BEGIN
	UPDATE funcionarios SET salario = salario*1.10 where id = id_param;
END;
$$ LANGUAGE 'plpgsql';

CALL aumentar_salario(1);
select * from funcionarios;
