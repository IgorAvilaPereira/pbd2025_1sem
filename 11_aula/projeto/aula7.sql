/*
    2025-05-26 22:10 @Igor
*/
DROP DATABASE aula7;

CREATE DATABASE aula7;

\c aula7;

CREATE TABLE medico (
    id serial primary key,
    crm character(5) unique,
    nome text
);
INSERT INTO medico (crm, nome) VALUES ('12345', 'Dr. David');


CREATE TABLE paciente (
    id serial primary key,
    nome character varying(100) not null,
    cpf character(11) unique,
    data_nascimento date
);
INSERT INTO paciente (nome, cpf, data_nascimento) VALUES ('RONALDO', '11111111111', '2001-12-07');

CREATE TABLE consulta (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    observacao text,
    medico_id integer references medico (id),
    paciente_id integer references paciente (id)
);

-- paciente_audit com as colunas id_audit serial primary key, operacao character varying(10) not null, data_hora timestamp default current_timestamp, usuario text, e as mesmas colunas da tabela paciente. Desenvolva um trigger que seja disparado após cada operação de INSERT, UPDATE ou DELETE na tabela paciente, inserindo um novo registro na tabela paciente_audit detalhando a operação, a data e hora, um nome de usuário fixo ('sistema'), e os dados do paciente antes da modificação (para DELETE e UPDATE) ou depois da modificação (para INSERT e UPDATE).

CREATE TABLE paciente_audit (
    id_audit serial primary key, 
    operacao character varying(10) not null, 
    data_hora timestamp default current_timestamp, 
    usuario text

);

CREATE TABLE consulta_historico_observacoes (
    id serial primary key,
    consulta_id integer references consulta (id) ON DELETE CASCADE, 
    data_hora timestamp default current_timestamp, 
    observacao text
);

CREATE TABLE notificacoes_pendentes (
    id serial primary key, 
    destinatario text not null, 
    assunto text not null, 
    mensagem text not null, 
    data_criacao timestamp default current_timestamp
);

ALTER TABLE paciente ADD COLUMN email TEXT;

CREATE OR REPLACE FUNCTION notificacao_function() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO notificacoes_pendentes (destinatario, assunto, mensagem) values (NEW.email, 'BOAS VINDAS', 'MEU ENTRASSE AQUI!');
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER notificacao_function_gatilho AFTER INSERT ON paciente FOR EACH 
ROW EXECUTE PROCEDURE notificacao_function();

CREATE OR REPLACE FUNCTION registra_consulta_observacao() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO consulta_historico_observacoes (consulta_id, observacao) VALUES (NEW.id, NEW.observacao);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER registra_consulta_observacao_gatilho AFTER INSERT OR UPDATE ON consulta FOR EACH 
ROW EXECUTE PROCEDURE registra_consulta_observacao();

CREATE OR REPLACE FUNCTION paciente_audit_function() RETURNS TRIGGER AS
$$
DECLARE
    qtde integer := 0;
BEGIN
   IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
        INSERT INTO paciente_audit (operacao, usuario) VALUES (TG_OP, NEW.nome);
        RETURN NEW;
    END IF;
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO paciente_audit (operacao, usuario) VALUES (TG_OP, OLD.nome);
        RETURN OLD;
   END IF;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER paciente_audit_function_gatilho BEFORE DELETE OR UPDATE ON paciente FOR EACH 
ROW EXECUTE PROCEDURE paciente_audit_function();

CREATE TRIGGER paciente_audit_function_gatilho2 AFTER INSERT OR UPDATE ON paciente FOR EACH 
ROW EXECUTE PROCEDURE paciente_audit_function();

CREATE TABLE consulta_log (
    id serial primary key,
    data_hora timestamp,
    medico_nome text
);

CREATE TABLE medico_log (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    medico_id integer,
    medico_nome text
);

CREATE OR REPLACE FUNCTION verifica_nro_maximo_por_data() RETURNS TRIGGER AS
$$
DECLARE
    qtde integer := 0;
BEGIN
    SELECT count(*) INTO qtde FROM consulta WHERE consulta.medico_id = NEW.medico_id AND cast(data_hora as date) = CAST(NEW.data_hora AS DATE);
--    RAISE NOTICE '%', qtde;
   
    IF (qtde >= 5) THEN
        RAISE EXCEPTION 'Atingiu limite máximo diário';
        -- RETURN NULL;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER verifica_nro_maximo_por_data_gatilho BEFORE INSERT OR UPDATE ON consulta FOR EACH 
ROW EXECUTE PROCEDURE verifica_nro_maximo_por_data();

-- Trigger para Garantir NOME em Maiúsculo: Elabore um trigger que, antes da inserção ou atualização de um registro na tabela medico, converta o valor do campo crm para letras maiúsculas.
CREATE OR REPLACE FUNCTION insere_e_atualiza_nome_em_maisculo() RETURNS TRIGGER AS
$$
BEGIN
    NEW.nome = UPPER(NEW.nome);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';
 
CREATE TRIGGER insere_e_atualiza_nome_em_maisculo_gatilho BEFORE INSERT OR UPDATE ON medico FOR EACH 
ROW EXECUTE PROCEDURE insere_e_atualiza_nome_em_maisculo();


CREATE OR REPLACE FUNCTION teste() RETURNS TRIGGER AS
$$
DECLARE
    medico_nome text;
BEGIN
    SELECT nome FROM medico WHERE id = NEW.medico_id INTO medico_nome;
    INSERT INTO consulta_log (data_hora, medico_nome) VALUES (NEW.data_hora, medico_nome);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION deletar_medico() RETURNS TRIGGER AS
$$
BEGIN
--    RAISE NOTICE '%',  OLD.id;
    DELETE FROM consulta WHERE medico_id = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION deletar_consulta() RETURNS TRIGGER AS
$$
DECLARE
    medico_aux TEXT;
BEGIN
    SELECT nome FROM medico WHERE id = OLD.medico_id INTO medico_aux;
    INSERT INTO consulta_log (data_hora, medico_nome) VALUES (OLD.data_hora, medico_aux);
    RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER deletar_consulta_gatilho AFTER DELETE ON consulta FOR EACH 
ROW EXECUTE PROCEDURE deletar_consulta();

CREATE OR REPLACE FUNCTION adicionar_medico() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO medico_log(medico_id, medico_nome) VALUES (NEW.id, NEW.nome);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';



CREATE OR REPLACE FUNCTION impedir_agendamentos_finais_de_semana() RETURNS TRIGGER AS
$$
DECLARE
    dia_da_semana integer;
BEGIN
    SELECT EXTRACT(dow from NEW.data_hora) INTO dia_da_semana;
    IF (dia_da_semana = 0 OR dia_da_semana = 6) THEN
        RAISE EXCEPTION 'Não pode agendar no final de semana';
        -- RETURN OLD;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER impedir_agendamentos_finais_de_semana_gatilho BEFORE INSERT OR UPDATE ON consulta FOR EACH 
ROW EXECUTE PROCEDURE impedir_agendamentos_finais_de_semana();

CREATE TRIGGER teste_gatilho AFTER INSERT ON consulta FOR EACH 
ROW EXECUTE PROCEDURE teste();

CREATE TRIGGER deletar_medico_gatilho BEFORE DELETE ON medico FOR EACH 
ROW EXECUTE PROCEDURE deletar_medico();

CREATE TRIGGER adicionar_medico_gatilho AFTER INSERT ON medico FOR EACH 
ROW EXECUTE PROCEDURE adicionar_medico();

INSERT INTO consulta (observacao, paciente_id, medico_id) values
('doença', 1, 1);


CREATE OR REPLACE FUNCTION obter_medico(id_aux bigint) RETURNS text AS
$$
DECLARE
    nome_aux text;
BEGIN
    select nome from medico where id = id_aux into nome_aux;
    RETURN nome_aux;
END;
$$ LANGUAGE 'plpgsql';

