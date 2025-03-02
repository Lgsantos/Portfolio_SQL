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
