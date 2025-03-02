--Criar banco de dados usando o arquivo dump_consultas_basicas1.sql
--1. Recuperar nome dos médicos que atendem na Clínica Bem Estar;
SELECT m.nome 
FROM Medico m JOIN MedicoClinica mc ON(m.cod = mc.medico_cod)
JOIN Clinica c ON(c.cod = mc.clinica_cod )
WHERE c.nome = 'clinica bem estar';

--2.  Exiba o nome e endereço das clínicas onde o médico André trabalha;
ELECT c.nome , c.endereco 
FROM Clinica c JOIN MedicoClinica mc ON(c.cod = mc.clinica_cod)
JOIN Medico m ON(mc.medico_cod = m.cod)
WHERE m.nome = 'Andre';

--3. Insira 2 clinicas , apenas na tabela Clínica
INSERT INTO Clinica 
VALUES (11, 'nova clinica 1', 'novo endereço 1'),
(12, 'nova clinica 2', 'novo endereço 2');

--4. Insira 2 médicos, apenas na tabela Medico
INSERT INTO Medico 
VALUES (11, 'Laércio', '1011-1111'),
(12, 'Romilda', '1212-1212');

--5. Liste o Nome das Clinicas e suas especialidades
SELECT c.nome, e.nome 
FROM Clinica c LEFT JOIN EspecialidadeClinica ec ON (c.cod = ec.clinica_cod)
LEFT JOIN Especialidade e ON (ec.especialidade_cod = e.cod);

--6.  Liste o Nome de todas as clinicas e suas Especialidade.Clinicas que não possuem especialidade devem aparecer. Ordenar o resultado pelo nome da Clinica.
SELECT c.nome, e.nome 
FROM Clinica c LEFT JOIN EspecialidadeClinica ec ON (c.cod = ec.clinica_cod)
LEFT JOIN Especialidade e ON (ec.especialidade_cod = e.cod)
ORDER BY c.nome;

--7. Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.
SELECT m.nome , c.`data` , c.hora 
FROM Medico m LEFT JOIN Consulta c ON(m.cod = c.medico_cod);

--8. Liste para cada médico, o seu nome e a quantidade de consultas que ele
possui.
SELECT m.nome , COUNT(c.`data`) 
FROM Medico m JOIN Consulta c ON(m.cod = c.medico_cod)
GROUP BY m.nome;

--9. Liste para cada médico, o seu nome e a quantidade de consultas que ele  possui. Médicos que não possuem consulta também devem aparecer no resultado.
SELECT m.nome , COUNT(c.`data`) 
FROM Medico m LEFT JOIN Consulta c ON(m.cod = c.medico_cod)
GROUP BY m.nome;

--10.  Listar nomes dos médicos que atendem na Clinica ortocentro.
SELECT m.nome 
FROM Medico m JOIN MedicoClinica mc ON(m.cod = mc.medico_cod)
JOIN Clinica c ON(mc.clinica_cod = c.cod)
WHERE c.nome = 'ortocentro';

--As consultas abaixo usam subconsulta:
--1. Listar nomes das Clinicas que tem especialidade
SELECT c.nome 
FROM Clinica c
WHERE c.cod  IN (SELECT ec.clinica_cod FROM EspecialidadeClinica ec);

--2. Listar nomes dos médicos que não tem consulta
SELECT m.nome 
FROM Medico m 
WHERE m.cod NOT IN (SELECT c.medico_cod FROM Consulta c);

--3. Listar nomes dos médicos que atendem na Clinica ortocentro
SELECT m.nome 
FROM Medico m 
WHERE m.cod IN (SELECT mc.medico_cod FROM MedicoClinica mc 
WHERE mc.clinica_cod IN (SELECT c.cod FROM Clinica c WHERE c.nome = 'ortocentro'));

--4. Criação da tabela Folha_pagto e inserção de dados:
CREATE TABLE Folha_Pagto ( medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod));

INSERT INTO Folha_Pagto VALUES (1,6,100), (1,2,150),(2,3,100), (2, 4, 150), (3,5,50);

5.Listar nomes dos médicos que recebem valor da consulta maior que a média
SELECT m.nome 
FROM Medico m  
WHERE m.cod IN (SELECT fp.medico_cod FROM Folha_Pagto fp 
WHERE fp.valor > (SELECT AVG(fp2.valor) FROM Folha_Pagto fp2));

6.Listar nome dos médidos que não estão na folha de pagto
SELECT m.nome 
FROM Medico m  
WHERE m.cod NOT IN (SELECT fp.medico_cod FROM Folha_Pagto fp );

Não usar subconsulta: Listar nome dos médicos e para aqueles que estão na folha de pagto, listar a média de salário
SELECT m.nome , AVG(fp.valor) 
FROM Medico m 
LEFT JOIN Folha_Pagto fp ON (m.cod = fp.medico_cod)
GROUP BY m.nome;

