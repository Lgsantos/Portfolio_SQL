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
