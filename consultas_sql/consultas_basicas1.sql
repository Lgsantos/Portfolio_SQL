SELECT m.nome , c.nome 
FROM Clinica c , Medico m , MedicoClinica mc 
WHERE m.cod = mc.medico_cod  AND c.cod = mc.clinica_cod AND m.nome = 'Arthur'

SELECT c.nome , e.nome 
FROM Clinica c , Especialidade e , EspecialidadeClinica ec 
WHERE c.cod = ec.clinica_cod AND e.cod = ec.especialidade_cod AND e.nome = 'ORTOPEDIA'

SELECT e.nome , m.nome 
FROM Medico m , Especialidade e, MedicoEspecialidade me  
WHERE m.cod = me.medico_cod AND e.cod = me.especialidade_cod AND m.nome = 'Andre'

SELECT m.nome , c.`data` 
FROM Medico m ,Consulta c 
WHERE m.cod = c.medico_cod 

SELECT m.nome 
FROM Medico m 
ORDER BY m.nome

--1.Para cada médico contar em quantas clinicas eles atendem. Resposta ordenada em ordem alfabética.

SELECT m.nome, count(c.nome)
FROM Medico m , Clinica c , MedicoClinica mc 
WHERE m.cod = mc.medico_cod AND c.cod = mc.clinica_cod
GROUP BY m.nome;

--2. Listar o nome dos médicos que tem 2 especialidades.

SELECT m.nome
FROM Medico m, Especialidade e, MedicoEspecialidade me
WHERE m.cod = medico_cod AND e.cod = especialidade_cod
GROUP BY m.nome
HAVING count(e.nome)=2;

--3. Listar o menor e maior horário de cada data de consulta  

SELECT c.data, min(c.hora), max(c.hora)
FROM Consulta c
GROUP BY c.data;

--4. Para cada clinica, listar o nome das suas especialidades, ordenado pelo nome da clinica.

SELECT c.nome , e.nome 
FROM Clinica c , Especialidade e , EspecialidadeClinica ec 
WHERE c.cod = ec.clinica_cod AND e.cod = ec.especialidade_cod 
ORDER BY c.nome;

--5. Para cada clínica, listar quantas especialidades ela atende.

SELECT c.nome , COUNT(*) 
FROM Clinica c , Especialidade e , EspecialidadeClinica ec 
WHERE c.cod = ec.clinica_cod AND e.cod = ec.especialidade_cod 
GROUP BY c.nome;

--6. Selecionar o nome da Clinica em que a media de horario das consultas é maior que 20.

SELECT c.nome
FROM Clinica c , Consulta c2  
WHERE c.cod = c2.clinica_cod 
GROUP BY c.nome
HAVING AVG(c2.hora)>200000 ;

--7. Listar o nome dos médicos que realizaram mais de 3 consultas:

SELECT m.nome
FROM Medico m  , Consulta c  
WHERE m.cod  = c.medico_cod  
GROUP BY m.nome
HAVING COUNT(*) > 3 ;

--8. Listar o número total de consultas realizadas por cada clínica:

SELECT c.nome, COUNT(c2.hora) 
FROM Clinica c , Consulta c2  
WHERE c.cod = c2.clinica_cod
GROUP BY c.cod ;
