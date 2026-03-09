-- Запуск от имени пользователя postgres через psql -U postgres -f create_user.sql

-- Удаляем пользователя, если он существует
DROP ROLE IF EXISTS testuser;

-- Создаём пользователя testuser с паролем
CREATE USER testuser WITH PASSWORD 'testpass';

-- Выдаем базовые права на создание БД и объектов
GRANT CONNECT ON DATABASE test TO testuser;
GRANT CREATE ON DATABASE postgres TO testuser;
GRANT USAGE, CREATE ON SCHEMA public TO testuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO testuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO testuser;
