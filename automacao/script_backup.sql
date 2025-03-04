-- Para criar um backup completo do banco de dados com o MySQL, usar a linha de comando abaixo:
-- mysqldump -u root -p nome_do_banco > backup.sql

-- Se quiser somente a estrutura do banco de dados, sem os dados, usar a linha de comando:
-- mysqldump -u root -p --no-data nome_do_banco > estrutura.sql

-- Se quiser somente os dados do banco de dados, sem a estrutura, usar a linha de comando:
-- mysqldump -u root -p --no-create-info nome_do_banco > dados.sql

-- Se precisar restaurar um backup, use o seguinte comando no terminal:
-- mysql -u root -p nome_do_banco < backup.sql

-- Se o banco ainda não existir, primeiro crie-o no MySQL:
-- CREATE DATABASE nome_do_banco;

-- Exemplo de Script de Backup Automático (Windows - .bat)
/*
@echo off
set TIMESTAMP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
mysqldump -u root -pSUASENHA nome_do_banco > C:\backups\banco_backup_%TIMESTAMP%.sql
echo Backup concluído!
*/
