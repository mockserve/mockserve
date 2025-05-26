FROM busybox:stable

ARG PORT=80
ENV PORT=$PORT

COPY www /www

WORKDIR /www

RUN touch /www/index.html

# Add tini
ARG TINI_VERSION=v0.19.0

RUN set -eux; \
    ARCH=$(case $(uname -m) in aarch64) echo arm64 ;; x86_64) echo amd64 ;; *) echo "unsupported arch" >&2; exit 1 ;; esac); \
    wget "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${ARCH}" -O /bin/tini; \
    chmod +x /bin/tini

# Expose your desired port (e.g. 80)
EXPOSE $PORT

# Start httpd serving /www
ENTRYPOINT ["/bin/tini", "--"]
CMD ["sh","-c","httpd -f -p $PORT -h /www"]
