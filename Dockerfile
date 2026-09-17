FROM nginx:1.29-alpine

RUN rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf

COPY nginx-main.conf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY 403.html 404.html 50x.html index.html robots.txt llms.txt /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

RUN mkdir -p /tmp/client_temp /tmp/proxy_temp_path /tmp/fastcgi_temp \
             /tmp/uwsgi_temp /tmp/scgi_temp \
    && chown -R nginx:nginx /usr/share/nginx/html /var/log/nginx \
                            /tmp/client_temp /tmp/proxy_temp_path \
                            /tmp/fastcgi_temp /tmp/uwsgi_temp /tmp/scgi_temp \
    && chmod -R 755 /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
