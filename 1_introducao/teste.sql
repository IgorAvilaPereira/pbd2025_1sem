DROP DATABASE teste;

CREATE DATABASE teste;

\c teste;

drop table animais;

CREATE TABLE animais (
    id serial primary key,
    nome text check (testar(nome) is TRUE)
);

CREATE OR REPLACE PROCEDURE procedimento() AS
$$
begin   
    INSERT INTO animais (nome) values ('Macaco');
end;
$$ LANGUAGE 'plpgsql';

DROP FUNCTION listar();

CREATE OR REPLACE procedure listar() AS
$$
DECLARE 
    registro animais%ROWTYPE;
BEGIN
    FOR registro IN SELECT * FROM animais ORDER BY id LOOP
        RAISE NOTICE '%', registro.nome;
    end loop;    
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION tipo() RETURNS text AS
$$
declare
    variavel animais.nome%TYPE;
begin
   variavel := 'oi';
   return variavel;     
end;
$$ language 'plpgsql';

CREATE OR REPLACE FUNCTION testar(n text) RETURNs boolean AS
$$
BEGIN
    IF (SUBSTRING(n, 1, 1) = UPPER(SUBSTRING(n, 1, 1))) THEN
        RETURN TRUE;
    END IF;
    RETURN FALSE;
END;
$$ LANGUAGE 'plpgsql';

DROP FUNCTION soma;

CREATE OR REPLACE FUNCTION soma (x text, text) RETURNS char AS
$$
DECLARE
    resultado text;
BEGIN
    resultado := 'Resultado: ';
--    RAISE NOTICE 'OI';
    INSERT INTO animais (nome) VALUES ('ELEFANTE');
    return resultado || x || $2;
END;
$$ LANGUAGE 'plpgsql';

SELECT soma('IGOR ', ' PEREIRA');

