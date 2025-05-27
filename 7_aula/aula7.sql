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

CREATE TABLE consulta_log (
    id serial primary key,
    data_hora timestamp,
    medico_nome text
);

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

CREATE TRIGGER teste_gatilho AFTER INSERT ON consulta FOR EACH 
ROW EXECUTE PROCEDURE teste();

INSERT INTO consulta (observacao, paciente_id, medico_id) values
('doença', 1, 1);

