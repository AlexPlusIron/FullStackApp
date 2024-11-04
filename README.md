Онлайн-магазин

Пользователь-Клиент: просмотр товаров, фильтрация товаров по категориям и брендам. Добавление/удаление товаров в корзину/из корзины, оформление заказов. Регистрация, авторизация, личный кабинет с историей заказов.

Пользователь-администратор: функционал клиента + просмотр оформленных заказов, создание/редактирование/удаление товаров/категорий/брендов.

Папка backend содержит серверную часть, реализованную на NodeJS+Express. Авторизация реализована на JWT.

Папка frontend содержит клиентскую часть, реализованную на React+Redux. 

Файл bandicam 2024-11-04 19-21-13-145.mp4 содержит видео запуска и работы приложения.

Файл shop_database.sql содержит предварительное наполнение таблиц (см. далее подробности заполнения БД)

ВАЖНО:

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

cd <Путь до папки>/shop/backend

npm install

npm run start-dev

5. Перейти в папку "frontend", устанавить пакеты, запустить клиент

cd <Путь до папки>/shop/frontend

npm install

npm start

В случае возникновения ошибки "Error: error:0308010c:digital envelope routines::unsupported" необходимо обновить React scripts до версии 5. Для этого нужно выполнить следующие команды:

cd <Путь до папки>/shop/frontend

npm uninstall react-scripts

run npm install react-scripts

***Примечания***

Пустые таблицы базы данных onlineshop будут созданы при первом запуске приложения. Дамп базы данных из файла "shop_database.sql" содержит некоторое наполнение таблиц, его можно загрузить в базу данных:

<Путь до папки>/postgre/bin/psql -U postgres onlineshop < <Путь до папки>/shop/shop_database.sql

Пароль: qwerty (или ваш пароль пользователя postgres)

Дамп базы данных содержит пользователей: обычных и с правами администратора:

admin@mail.ru, пароль "qwerty"

simpleuser@mail.ru, пароль "qwerty"

"# FullStackApp" 
