FROM busybox:stable

WORKDIR /www

RUN touch /www/index.html

# Expose your desired port (e.g. 8080)
EXPOSE 80

# Start httpd on port 8080 serving /www
CMD ["httpd", "-f", "-p", "80", "-h" , "/www"]
