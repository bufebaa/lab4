FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN echo "server { listen 0.0.0.0:\$PORT; root /usr/share/nginx/html; index index.html; }" > /etc/nginx/conf.d/default.conf

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
