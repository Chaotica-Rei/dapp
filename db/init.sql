-- Удаляем БД если существует
DROP DATABASE IF EXISTS test;

-- Удаляем пользователя если существует
DROP ROLE IF EXISTS testuser;

-- Создаем пользователя
CREATE USER testuser WITH PASSWORD 'testpass';

-- Создаем БД test
CREATE DATABASE test OWNER testuser;

-- Подключаемся к базе test
\c test

-- Удаляем таблицу если есть
DROP TABLE IF EXISTS users;

-- Создаем таблицу
CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(50),
 age INT,
 email VARCHAR(100)
);

-- Даем права пользователю
GRANT ALL PRIVILEGES ON TABLE users TO testuser;
GRANT ALL PRIVILEGES ON SEQUENCE users_id_seq TO testuser;

-- Импортируем CSV
\copy users(name, age, email) FROM :'csv_path' DELIMITER ',' CSV HEADER;