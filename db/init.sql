--Запуск через psql -U postgres -f init.sql

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

-- Подключаемся к БД test
\c test

-- Удаляем таблицу users, если она существует
DROP TABLE IF EXISTS users;

-- Создаём таблицу users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);

-- Даём права на таблицу и последовательность
GRANT ALL PRIVILEGES ON TABLE users TO testuser;
GRANT ALL PRIVILEGES ON SEQUENCE users_id_seq TO testuser;

-- Импортируем данные из CSV (путь указывается при запуске)
\copy users(name, age, email) FROM 'users.csv' DELIMITER ',' CSV HEADER;
