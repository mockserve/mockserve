FROM busybox:stable

ARG PORT=80
ENV PORT=$PORT

COPY www /www

WORKDIR /www

RUN touch /www/index.html

# Expose your desired port (e.g. 80)
EXPOSE $PORT

# Start httpd serving /www
CMD ["sh","-c","httpd -f -p $PORT -h /www"]
