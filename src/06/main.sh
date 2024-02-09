#!/bin/bash

docker stop $(docker ps -aq)  # остановить все контейнеры
docker rm $(docker ps -aq)  # удаляем все найденные контейнеры
docker rmi -f $(docker images -q)  # удаляем все найденные образы

docker pull nginx

docker-compose build
docker-compose up -d

echo "------------------------------"
docker images
echo "------------------------------"
docker ps -a
echo "------------------------------"
docker-compose images  # вывести список образов
echo "------------------------------"
docker-compose ps  # вывести список контейнеров
echo "------------------------------"
# docker-compose down # команда позволяет останавливать и удалять контейнеры и другие ресурсы, созданные командой docker-compose up