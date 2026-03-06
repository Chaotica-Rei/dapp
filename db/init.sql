-- Создаем БД test и таблицу users 

DROP DATABASE IF EXISTS test;

CREATE DATABASE test;

\c test

DROP TABLE IF EXISTS users;

CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(50),
 age INT,
 email VARCHAR(100)
);

-- Импортируем данные из CSV файла в таблицу users

\copy users(name, age, email) FROM :'csv_path' DELIMITER ',' CSV HEADER;