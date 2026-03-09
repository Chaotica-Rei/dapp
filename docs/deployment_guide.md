1. Разворачивание ВМ 

![Развернутые ВМ в VirtualBox](../assets/vm.png)

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

4. Клонируем Git-репозиторий на виртуальные машины VM1 и VM2:

```bash
git clone https://github.com/Chaotica-Rei/dapp.git
```

5. Настраиваем сетевое взаимодействие

На VM1:

```bash
cd dapp/scripts
sudo chmod +x ubuntu-rules.sh
sudo ./ubuntu-rules.sh
```

на VM2:

```bash
cd dapp/scripts
sudo chmod +x centos-rules.sh
sudo ./centos-rules.sh
```

6. Запускаем создание БД на VM1:

```bash
cd dapp/db
psql -f init.sql
```

7. Устанавливаем пакеты

На VM1:

На VM2: