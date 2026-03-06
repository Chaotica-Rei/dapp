1. Разворачивание ВМ 

![Развернутые ВМ в VirtualBox](assets/vm.png)

2. Установка PostgreSQL на VM1 (Ubuntu):  

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

3. Установка Redis на VM2 (CentOS), используется форк Valkey 8.0.6:  

```bash
sudo dnf update  
sudo dnf install valkey  
sudo systemctl start valkey  
sudo systemctl enable valkey
```

4. Клонируем Git-репозиторий на VM1, запускаем создание БД:

```bash
cd db
psql -f init.sql
```