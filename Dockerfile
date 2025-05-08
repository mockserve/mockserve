FROM busybox:stable⁠

WORKDIR /www

RUN touch /www/index.html

# Expose your desired port (e.g. 8080)
EXPOSE 8080

# Start micro_httpd on port 8080 serving /www
CMD ["httpd", "-f", "-p", "8080", "-h" , "/www"]
