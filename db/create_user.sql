-- Запуск от имени пользователя postgres через psql -U postgres -f create_user.sql

-- Удаляем пользователя, если он существует
DROP ROLE IF EXISTS testuser;

-- Создаём пользователя testuser с паролем
CREATE USER testuser WITH PASSWORD 'testpass';

-- Выдаем базовые права на создание БД и объектов
GRANT CREATE ON DATABASE postgres TO testuser;
GRANT USAGE, CREATE ON SCHEMA public TO testuser;
