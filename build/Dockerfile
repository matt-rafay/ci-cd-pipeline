FROM nginx:alpine

LABEL maintainer="matt-rafay <https://github.com/matt-rafay>"

COPY html /usr/share/nginx
COPY nginx/certs /etc/nginx/certs
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
