@echo off
set TIMESTAMP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
mysqldump -u root -pSUASENHA nome_do_banco > C:\backups\banco_backup_%TIMESTAMP%.sql
echo Backup concluído!
