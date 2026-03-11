#!/bin/bash

echo "Applying iptables rules for PROXY (CentOS Stream 10)..."

# Очистка
iptables -F
iptables -X

# Политики по умолчанию
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Разрешаем localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Разрешаем уже установленные соединения
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Proxy принимает запросы  на порт 5000 от любого источника
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

# Proxy имеет доступ к Backend (указывать фактический IP-адрес Backend)
iptables -A OUTPUT -p tcp -d 192.168.0.177 --dport 8080 -j ACCEPT

# Proxy имеет доступ к Redis (локально)
iptables -A OUTPUT -p tcp --dport 6379 -j ACCEPT
iptables -A INPUT -p tcp --sport 6379 -j ACCEPT

echo "Proxy rules applied"