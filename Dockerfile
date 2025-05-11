FROM busybox:stable

ARG PORT=80

WORKDIR /www

RUN touch /www/index.html

# Expose your desired port (e.g. 80)
EXPOSE $PORT

# Start httpd serving /www
CMD ["httpd", "-f", "-p", "${{PORT}}", "-h" , "/www"]
