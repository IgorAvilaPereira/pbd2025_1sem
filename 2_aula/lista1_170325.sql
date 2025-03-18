-- drop function deletar_funcionario;
CREATE OR REPLACE FUNCTION deletar_funcionario(id_aux bigint) RETURNS BOOLEAN AS
$$
DECLARE	
	registro RECORD;
BEGIN	
	SELECT * FROM funcionarios where id = id_aux INTO registro;
	if (registro.id > 0) THEN
		deLETE FROM funcionarios where id = id_aux;
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END;
$$ LANGUAGE 'plpgsql';

SELECT deletar_funcionario(2);
select * from funcionarios;
-- 5

CREATE OR REPLACE FUNCTION media_salarial(departamento_aux text) RETURNS numeric(10,2) AS
$$
DECLARE
	media_salarial numeric(10,2);
BEGIN
	SELECT coalesce(AVG(salario), 0) FROM funcionarios where departamento = departamento_aux INTO media_salarial;
	RETURN media_salarial;	
END;
$$ LANGUAGE 'plpgsql';

CALL inserir_funcionario('Ronaldo', '2001-07-12', 'carnaval', 1.99);
CALL inserir_funcionario('David', '2003-04-28', 'carnaval', 1.99);
SELECT media_salarial('carnaval3');


CREATE or replace PROCEDURE atualizar_departamento(id_aux bigint, novo_departamento text) AS
$$ 
BEGIN
	UPDATE funcionarios SET departamento = novo_departamento where id = id_aux;
END;
$$ LANGUAGE 'plpgsql';


call atualizar_departamento(3, 'rh');
select * from funcionarios;


CREATE OR REPLACE FUNCTION qtde_departamento(departamento_aux text) returns integer AS
$$
DECLARE
	qtde integer;
begin
     select coalesce(count(*), 0) from funcionarios where departamento = departamento_aux into qtde;
	 return qtde;
end;
$$ language 'plpgsql';

select qtde_departamento('rh');

CREATE OR REPLACE PROCEDURE reduzir_salario(id_aux bigint) AS
$$
BEGIN	
	UPDATE funcionarios SET salario = salario*0.95 where id = id_aux;
END;
$$ LANGUAGE 'plpgsql';


call reduzir_salario(3);
select * from funcionarios;

CREATE OR REPLACE function soma_salarios() returns numeric(10,2) as
$$
declare
	somatorio numeric(10,2);
begin
	select sum(salario) from funcionarios into somatorio;
	return somatorio;
end;	
$$ language 'plpgsql';

select soma_salarios();


drop function listar_todos;
-- 10. Crie uma stored procedure que liste todos os funcionários de um determinado departamento.
CREATE OR REPLACE FUNCTION listar_todos() RETURNS TABLE (nome_aux varchar) AS
$$
BEGIN	
	RETURN QUERY SELECT nome FROM funcionarios;
END;
$$ LANGUAGE 'plpgsql';

select * from listar_todos();


