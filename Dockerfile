FROM alpine:latest

# Install micro_httpd
RUN apk add --no-cache micro-httpd

# Set working directory (serves this folder)
WORKDIR /www

RUN touch /www/index.html

# Expose your desired port (e.g. 8080)
EXPOSE 8080

# Start micro_httpd on port 8080 serving /www
CMD ["micro_httpd", "-p", "8080", "/www"]
