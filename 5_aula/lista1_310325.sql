-- 16. Crie uma stored procedure que aplique um bônus salarial de acordo com a idade.
CREATE OR REPLACE FUNCTION bonus_salarial() RETURNS BOOLEAN AS
$$
DECLARE
	registro RECORD;
BEGIN
	BEGIN
		UPDATE funcionarios SET salario = salario * (1.00 + cast(extract(year from age(data_nascimento)) as real)/100.0);
	EXCEPTION
		WHEN OTHERS THEN raise notice 'ERRO';
		RETURN FALSE;
	END;
	RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';
select bonus_salarial();
SELECT nome,salario from funcionarios;

CREATE OR REPLACE PROCEDURE bonus_salarial_by_jaifer() AS
$$
BEGIN
	update funcionarios set salario = salario * 1.05 where DATE_PART('year', age(data_nascimento)) < 25;
END;
$$ LANGUAGE 'plpgsql';

call bonus_salarial_by_jaifer();
select salario, age(data_nascimento) from funcionarios;

-- 17. Crie uma function que retorne a quantidade total de funcionários na tabela.
CREATE OR REPLACE FUNCTION qtde() RETURNS INTEGER AS
$$
DECLARE
	quantidade integer;
BEGIN
	select coalesce(count(*), 0) from funcionarios into quantidade;
	return quantidade;
end;
$$ LANGUAGE 'plpgsql';

select qtde();

-- 18. Crie uma procedure que atualize o salário de todos os funcionários em 10%.
create or replace procedure aumenta_salario(porcentagem real) AS
$$
BEGIN
	UPDATE funcionarios SET salario = salario * (1.00 + porcentagem);
END;
$$ LANGUAGE 'plpgsql';

call aumenta_salario(0.05);

select nome, salario from funcionarios;

-- 19. Crie uma function que retorne o maior salário entre todos os funcionários.
CREATE OR REPLACE FUNCTION maior_salario() RETURNS numeric(10,2) AS
$$
DECLARE	
	maior_salario numeric(10,2);
BEGIN
	select coalesce(max(salario),0) from funcionarios into maior_salario;
	return maior_salario;
END;
$$ LANGUAGE 'plpgsql';

select maior_salario();


-- 20. Crie uma stored procedure que delete todos os funcionários de um determinado departamento.
create or replace procedure deletar_por_departamento(departamento_aux varchar(50)) AS
$$
BEGIN
	delete from funcionarios where departamento = departamento_aux;
END;
$$ LANGUAGE 'plpgsql';

call deletar_por_departamento('teste');

select * from funcionarios;


CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE funcionarios_projetos (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);

CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    data_inicio DATE,
    data_fim DATE
);
insert into projetos (nome, data_inicio, data_fim) VALUES('PROJETO1', CURRENT_DATE, CURRENT_DATE + INTERVAL '7 DAYS');

CREATE TABLE funcionarios_projetos (
    id SERIAL PRIMARY KEY,
    funcionario_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);
Insert into funcionarios_projetos(funcionario_id, projeto_id) VALUES(3, 1);
SELECT * FROM funcionarios;

-- extra
-- Selecionar funcionários que trabalham um projeto específico
CREATE OR REPLACE FUNCTION listar_funcionarios_por_projeto(nome_projeto VARCHAR(100)) RETURNS TABLE (nome_aux varchar(100)) AS
$$
BEGIN
	RETURN QUERY select funcionarios.nome from funcionarios 
				inner join funcionarios_projetos 
				on (funcionarios.id = funcionarios_projetos.funcionario_id) 
				inner join projetos on (funcionarios_projetos.projeto_id = projetos.id) 
				where projetos.nome = nome_projeto;
END;
$$ LANGUAGE 'plpgsql';

select * from listar_funcionarios_por_projeto('PROJETO1') where nome_aux = 'betito';



