Установка PostgreSQL на VM1 (Ubuntu):  

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

Установка Redis на VM2 (CentOS):  

```bash
sudo dnf update  
sudo dnf install valkey  
sudo systemctl start valkey  
sudo systemctl enable valkey
```

Клонируем Git-репозиторий на VM1, запускаем создание БД:

```bash
cd db
psql -f init.sql
```