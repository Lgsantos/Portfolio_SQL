-- Para criar um backup completo do banco de dados com o MySQL, usar a linha de comando abaixo:
-- mysqldump -u root -p nome_do_banco > backup.sql

-- Se quiser somente a estrutura do banco de dados, sem os dados, usar a linha de comando:
-- mysqldump -u root -p --no-data nome_do_banco > estrutura.sql

-- Se quiser somente os dados do banco de dados, sem a estrutura, usar a linha de comando:
-- mysqldump -u root -p --no-create-info nome_do_banco > dados.sql
