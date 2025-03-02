--1)  cria uma tabela Empregado com id, nome e salario. o id deve ser com auto incremento:

create table empregado ( id integer auto_increment, nome varchar(20), salario float, primary key(id));

/*2) procedure Insere10  para inserir 10 tuplas na tabela Empregado
cont - variavel contadora
insert into empregado (nome, salario) values (concat('nome', cont), salario);
salario: a critério do aluno*/

DELIMITER $$

CREATE PROCEDURE Insere10()
BEGIN
DECLARE cont INT; 
    	DECLARE salario FLOAT;
SET cont = 1;

WHILE cont <= 10 DO
        SET salario = 1000 * cont;
        INSERT INTO empregado (nome, salario) VALUES (CONCAT('nome', cont), salario);
        SET cont = cont + 1;
   	END WHILE;
END $$
DELIMITER ;

CALL Insere10();


--3) Procedure que mostre a quantidade de empregados inseridos na tabela Empregado
--Nota: é preciso criar uma variável de usuário (@total) para mostrar o valor da consulta. Isso não é necessário com uma função armazenada

DELIMITER $$
CREATE PROCEDURE ver_quantidade(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade
    FROM empregado;
END $$
DELIMITER ;

CALL ver_quantidade(@total);
SELECT @total;

--4) Função que retorne a quantidade de empregados inseridos na tabela Empregado

DELIMITER $$

CREATE FUNCTION ver_quantidade_func()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM empregado;
    RETURN total;
END $$

DELIMITER ;

SELECT ver_quantidade_func();
