-- Criar banco de dados com o arquivo dump_visoes.sql
--1) Selecionar o nome dos pilotos e nome dos circuitos que eles participaram
CREATE VIEW pilotocircuito
AS SELECT DISTINCT p.nomepil , c.nomecir 
FROM piloto p , circuito c , pospilotoprova p2 
WHERE p2.codpil = p.codpil 
AND p2.codcirc = c.codcirc; 

--2) Selecionar o nome de todos os pilotos do banco de dados e para aqueles que participaram de prova, listar a data da prova, duração e posição do piloto na prova.
CREATE VIEW pilotodataduracaopos
AS SELECT p.nomepil , p2.`data` , p3.duracao , p2.posicao 
FROM piloto p  
LEFT JOIN pospilotoprova p2
ON p.codpil = p2.codpil 
LEFT JOIN prova p3 
ON p3.codcirc = p2.codcirc AND p3.`data` = p2.`data` ;

--3) Selecionar o nome do piloto, seu país de origem, nome da equipe e país da equipe. 
CREATE VIEW pilotopaiseqpais
AS SELECT p.nomepil , p2.nomepais as pais_piloto, e.nomeeq, p3.nomepais as pais_equipe
FROM piloto p , pais p2, equipe e, pais p3
WHERE p.codpais = p2.codpais 
AND p.codeq = e.codeq  
AND e.codpais = p3.codpais;

--4) Listar o nome das equipes que não possuem piloto
CREATE VIEW equipesempiloto
AS SELECT e.nomeeq 
FROM equipe e 
WHERE e.codeq NOT IN 
(SELECT p.codeq 
FROM piloto p);

--As consultas abaixo usam as visões criadas acima:
--1) Para cada nome de piloto, indique quantos circuitos eles participaram
SELECT p.nomepil , COUNT(p.nomecir) 
FROM pilotocircuito p 
GROUP BY p.nomepil;

2) Listar o nome do piloto e o nome da sua equipe
SELECT p.nomepil , p.nomeeq 
FROM pilotopaiseqpais p ;

3) Listar os pilotos que são do mesmo país que a sua equipe 
SELECT p.nomepil 
FROM pilotopaiseqpais p 
WHERE p.pais_piloto <> p.pais_equipe ;
