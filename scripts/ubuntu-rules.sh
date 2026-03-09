#!/bin/bash

# Очищаем все текущие правила iptables
iptables -F

# Разрешаем loopback
iptables -A INPUT -i lo -j ACCEPT

# Разрешаем SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Backend принимает только от прокси
iptables -A INPUT -p tcp --dport 8080 -s 192.168.0.117 -j ACCEPT 

# PostgreSQL принимает только от Backend (localhost)
iptables -A INPUT -p tcp --dport 5432 -s 127.0.0.1 -j ACCEPT

# Остальное запрещаем
iptables -A INPUT -j DROP
