-- Запуск от пользователя testuser через psql -U testuser -d test -f init_db.sql

-- Удаляем БД test, если она существует
DROP DATABASE IF EXISTS test;

-- Создаём БД test (владельцем автоматически становится testuser)
CREATE DATABASE test;

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

-- Даём права на таблицу и последовательность (на всякий случай, хотя владелец уже testuser)
GRANT ALL PRIVILEGES ON TABLE users TO testuser;
GRANT ALL PRIVILEGES ON SEQUENCE users_id_seq TO testuser;

-- Импортируем данные из CSV (путь указывается при запуске)
\copy users(name, age, email) FROM 'users.csv' DELIMITER ',' CSV HEADER;
