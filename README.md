# Servers

Настройки виртуальных серверов.

## TODO

* Написать плейбук для предварительной настройки сервера, 
  создания пользователя для входа, пользователя для
  деплоя, отключения ssh-логина для root.

## Структура сервера приложений

Структура состоит из двух слоев:

- Frontend. Набор конфигов Nginx, которые отвечают за передачу запросов к приложению. 
    По большей части эти конфиги содержат в себе описания прокси и настройки сертификатов.
    
- Backend. Набор приложений. Каждое приложение представляет собой набор docker-контейнеров,
    определяется пользователем, конфигурацией в переменных окружения, конфигурацией cron-задач
    и другими настройками. Приложения изолированы друг от друга.
