FROM nginx:latest
WORKDIR /home
RUN apt-get update && \
    apt-get install -y libfcgi-dev gcc && \
    rm -rf /var/lib/apt/lists && \
    chown -R nginx /home && \
    chown -R nginx /var/cache/nginx
USER nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server/mini_server.c .
COPY run.sh .
CMD ["bash","run.sh"]
