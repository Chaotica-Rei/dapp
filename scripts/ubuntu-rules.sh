#!/bin/bash

# Скрипт для настройки iptables на Backend (Ubuntu 24.04.3 LTS)
# Для приема запросов Backend'ом от прокси указываем IP-адрес ВМ прокси (в данном примере 192.168.0.117)

echo "Applying iptables rules for BACKEND (Ubuntu 24.04.3 LTS)..."

# Очистка
iptables -F
iptables -X

# Политики
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# установленные соединения
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Backend принимает запросы только от прокси (указать фактический IP-адрес ВМ прокси)
iptables -A INPUT -p tcp -s 192.168.0.117 --dport 8080 -j ACCEPT

# Backend имеет доступ только к PostgreSQL
iptables -A OUTPUT -p tcp --dport 5432 -j ACCEPT

# PostgreSQL принимает только от Backend (локально)
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 5432 -j ACCEPT

echo "Backend rules applied"