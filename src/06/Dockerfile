FROM nginx

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./start.sh /home/start.sh

# Устанавливаем необходимые зависимости, очищаем кэш apt и устанавливаем права
RUN apt-get update && \
    apt-get install -y gcc libfcgi-dev lighttpd && \
    chmod +x /home/start.sh && \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Задаём пользователя
USER nginx
# Используем полный путь к файлу start.sh в ENTRYPOINT
ENTRYPOINT [ "bash", "/home/start.sh" ]
# Отключаем проверку состояния контейнера
HEALTHCHECK NONE