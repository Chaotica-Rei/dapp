## Работающие сервисы в systemctl 

Для Backend:

![backend-api.service](../assets/backend_systemctl.png)

Для Proxy:

![cache-api.service](../assets/proxy_systemctl.png)

## Curl-запросы и логи

Выполняем запросы к прокси локально:

![local_request](../assets/requests.png)

Выполняем запросы к прокси от другого источника (например, хостовая ОС с IP 192.168.0.138):

![host_request](../assets/request_from_host.png)

Смотри логи, видим запросы к прокси, выполненные локально и от другой машины с адресом 192.168.0.138:

![request_log](../assets/request_log.png)