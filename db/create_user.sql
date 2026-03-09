-- Запуск через psql -U postgres -f create_user.sql

-- Удаляем БД если существует
DROP DATABASE IF EXISTS test;

-- Удаляем пользователя если существует
DROP ROLE IF EXISTS testuser;

-- Создаем пользователя
CREATE USER testuser WITH PASSWORD 'testpass';

-- Создаем базу данных и сразу назначаем владельца
CREATE DATABASE test OWNER testuser;

-- Даём все права на БД
GRANT ALL PRIVILEGES ON DATABASE test TO testuser;