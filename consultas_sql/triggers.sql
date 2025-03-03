-- Use o arquivo dump_consultas_basicas1.sql para criar o banco de dados com a tabela medico
CREATE TABLE log_exclusoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medico_id INT,
    medico_nome VARCHAR(100),
    data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER before_medico_delete
BEFORE DELETE ON medico
FOR EACH ROW
BEGIN
    INSERT INTO log_exclusoes (medico_id, medico_nome)
    VALUES (OLD.cod, OLD.nome);
END $$

DELIMITER ;
