CREATE OR REPLACE FUNCTION existe2(id_aux bigint) RETURNS BOOLEAN AS
$$
DECLARE
	qtde integer := 0;
BEGIN
	SELECT count(*) FROM funcionarios where id = id_aux INTO qtde;
	IF qtde = 0 THEN
		RETURN FALSE;
	END IF;		
	RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION existe(id_aux bigint) RETURNS BOOLEAN AS
$$
BEGIN
	RETURN EXISTS(SELECT * FROM funcionarios where id = id_aux);
END;
$$ LANGUAGE 'plpgsql';

SELECT existe(1);
SELECT existe2(3);

-- 12. Crie uma procedure que mude o nome de um funcionário com base no ID.
CREATE OR REPLACE PROCEDURE alterar_novo(id_aux bigint, novo_nome character varying(100)) AS
$$
BEGIN
	UPDATE funcionarios SET nome = novo_nome WHERE id = id_aux;
END;
$$ LANGUAGE 'plpgsql';

CALL alterar_novo(3, 'betito');
select * from funcionarios where id = 3;

-- 13. Crie uma function que retorne a idade média dos funcionários.
CREATE OR REPLACE FUNCTION media() returns real as
$$ 
DECLARE
	media real := 0;
BEGIN	
	select avg(extract(year from age(data_nascimento))) from funcionarios into media;
	return media;
end;
$$ language 'plpgsql';

select media();

-- off-topic
CREATE OR REPLACE FUNCTION qual_geracao(data_aux date) RETURNS text AS
$$
BEGIN
	IF EXTRACT(YEAR FROM data_aux) >= 1940 and EXTRACT(YEAR FROM data_aux)  <= 1960 THEN
		RETURN 'BABY BOOMERS';
	END IF;
	IF EXTRACT(YEAR FROM data_aux) > 1960 and EXTRACT(YEAR FROM data_aux)  <= 1980 THEN
		RETURN 'GERAÇÃO X';
	END IF;
	IF EXTRACT(YEAR FROM data_aux) > 1980 and EXTRACT(YEAR FROM data_aux)  <= 1995 THEN
		RETURN 'GERAÇÃO Y';
	END IF;
	IF EXTRACT(YEAR FROM data_aux) > 1995 and EXTRACT(YEAR FROM data_aux)  <= 2010 THEN
		RETURN 'GERAÇÃO Z';
	END IF;
	IF EXTRACT(YEAR FROM data_aux) > 2010 and EXTRACT(YEAR FROM data_aux)  <= 2025 THEN
		RETURN 'ALPHA';
	END IF;
END;
$$ LANGUAGE 'plpgsql';

SELECT qual_geracao('1987-01-20');
SELECT qual_geracao('2003-04-28');

select *, qual_geracao(data_nascimento) from funcionarios where  qual_geracao(data_nascimento) = 'GERAÇÃO Y';


drop procedure insere_multiplos2;

CREATE OR REPLACE procedure insere_multiplos2(vet_nome varchar[], vet_data_nascimento date[], vet_departamento varchar[], vet_salario numeric[]) AS
$$
declare 
	tam_vet_nome integer := 0;
	tam_vet_data_nascimento integer := 0;
	tam_vet_departamento integer := 0;
	tam_vet_salario integer := 0;
	i integer := 1;
begin
	tam_vet_nome := array_length(vet_nome, 1);
	tam_vet_data_nascimento := array_length(vet_data_nascimento, 1);
	tam_vet_departamento := array_length(vet_departamento, 1);
	tam_vet_salario := array_length(vet_salario, 1);
	if (tam_vet_nome > 0)  then
		if (tam_vet_nome = tam_vet_data_nascimento and tam_vet_data_nascimento = tam_vet_departamento and tam_vet_departamento = tam_vet_salario) THEN
			WHILE (i <= tam_vet_nome) LOOP
				INSERT INTO funcionarios (nome, data_nascimento, departamento, salario) VALUES
				(vet_nome[i], vet_data_nascimento[i], vet_departamento[i], vet_salario[i]);
				i := i + 1;
			END LOOP;
		else 
			RAISE NOTICE 'tamanhos diferentes';
		end if;
	else
		RAISE NOTICE 'tamanhos devem ser maior que zero!';
	end if;
end;
$$ LANGUAGE 'plpgsql';

call insere_multiplos2(array['marcio'::varchar, 'telecken'::varchar, 'cleber'::varchar], array['2010-01-01'::date, '1900-01-01'::date, '1980-01-01'::date], array['info'::varchar, 'info'::varchar, 'info'::varchar], array[1.99::numeric, 1.99::numeric, 1.99::numeric]);

select * from funcionarios;


CREATE OR REPLACE FUNCTION mais_jovem() RETURNS varchar as
$$
declare
	nome_aux varchar;
BEGIN
	select nome from funcionarios order by data_nascimento desc limit 1 into nome_aux;
	return nome_aux;
end;	
$$ language 'plpgsql';

CREATE OR REPLACE FUNCTION mais_jovem2() RETURNS table(nome_aux varchar) AS
$$
BEGIN
	return query select nome from funcionarios where data_nascimento = (select data_nascimento from funcionarios order by data_nascimento desc limit 1);
end;	
$$ language 'plpgsql';

insert into funcionarios (nome, data_nascimento, departamento, salario) values ('teste', '2010-01-01', 'teste', 1.99);


select mais_jovem2();


