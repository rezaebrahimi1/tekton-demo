FROM registry.ficld.ir/alpine:latest
LABEL maintainer="stuart@newlymintedmedia.com"
RUN apk add nginx
RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www
CMD ["nginx","-g","daemon off;"]
