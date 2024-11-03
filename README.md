﻿ВАЖНО:
Для запуска приложения должны быть установлены следующие утилиты:
PostgreSQL для работы с базой данных
NodeJS для работы серверной и клиентской части приложения

Порядок установки и запуска:

1. Скопировать репозиторий в папку "shop"

2. Создать базу данных с помощью утилиты "psql"

<Путь до папки>/postgre/bin/psql -U postgres

Пароль: qwerty (или ваш пароль пользователя postgres)

postgres=# CREATE DATABASE onlineshop;

postgres=# \q


3. Имя базы данных, логин и пароль сохранить в файле "backend/.env"

DB_HOST=localhost
DB_NAME=onlineshop
DB_USER=postgres
DB_PASS=qwerty (или ваш пароль пользователя postgres)
DB_PORT=5432

4. Перейти в папку "backend", устанавить пакеты, запустить сервер

cd .../shop/backend
npm install
npm run start-dev

5. Перейти в папку "frontend", устанавить пакеты, запустить клиент


cd .../shop/frontend
npm install
npm start


***Примечания***

Пустые таблицы базы данных будут созданы при первом запуске приложения. Дамп базы данных из файла "shop_database.sql" содержит некоторое наполнение таблиц, его можно загрузить в базу данных:

<Путь до папки>/postgre/bin/psql -U postgres onlineshop < <Путь до папки>/shop/shop_database.sql
Пароль: qwerty (или ваш пароль пользователя postgres)

Дамп базы данных содержит пользователей: обычных и с правами администратора:

admin@mail.ru, пароль "qwerty"
admin2@mail.ru, пароль "qwerty"
simpleuser@mail.ru, пароль "qwerty"
simpleuser2@mail.ru, пароль "qwerty"

"# FullStackApp" 