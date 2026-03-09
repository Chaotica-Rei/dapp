#!/bin/bash

# Очищаем все текущие правила iptables
iptables -F

# Разрешаем весь трафик через loopback (localhost) для работы локальных сервисов (proxy ↔ valkey)
iptables -A INPUT -i lo -j ACCEPT

# Разрешаем SSH, чтобы можно было подключаться к ВМ
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Разрешаем входящие подключения к прокси со всех источников, прокси слушает порт 5000 (Flask)
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

# Разрешаем доступ к Valkey только с localhost
iptables -A INPUT -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT

# Запрещаем весь остальной входящий трафик
iptables -A INPUT -j DROP
