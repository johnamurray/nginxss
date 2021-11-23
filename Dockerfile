FROM alpine

RUN apk add --no-cache nginx openssl curl

RUN openssl req -x509 -nodes -days 365 -subj "/C=AU/ST=NSW/O=TCTL/CN=tctl.local" -addext "subjectAltName=DNS:tctl.local" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
RUN chown nginx /etc/ssl/private/nginx-selfsigned.key
USER nginx
COPY default.conf /etc/nginx/http.d/default.conf
COPY tstl-local-tls.conf /etc/nginx/http.d/tstl-local-tls.conf
COPY index.html /var/www/localhost/htdocs/index.html
# EXPOSE PORT
EXPOSE 443
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
