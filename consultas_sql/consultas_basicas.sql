SELECT * FROM ATOR;

SELECT * FROM ATOR
WHERE nomeart LIKE "D%";

SELECT nomeart AS "Nome Artístico" FROM ATOR;
WHERE idade <= 40;

INSERT INTO ator
VALUES (6, "PauloBett", "PedroPauloBett", "Brasil", "m", 43, 0, 0); 

INSERT INTO ator
VALUES 
(7, "XuiLee", "Xui Li Xien", "China", "f", 27, 0, 0),
(8, "CaduMoliterno", "EduardoMoliterno", "Brasil", "m", 35, 0, 0);

UPDATE ator
SET idade = 44
WHERE coda = 8;

DELETE FROM ator
WHERE nomeart = "XuiLee"
LIMIT 1;

DELETE FROM ator
WHERE coda = 8;

SELECT COUNT(*) AS "Qtd de Atrizes" FROM ator
WHERE sexo = "f";

SELECT AVG(idade) AS "Média de idade dos atores"
FROM ator;