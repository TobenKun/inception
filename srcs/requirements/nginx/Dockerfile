FROM alpine:3.21.3

RUN apk update && apk add --no-cache nginx \
    openssl

COPY default.conf /etc/nginx/http.d/.
COPY ./ssl /etc/ssl/

CMD ["nginx", "-g", "daemon off;"]
