FROM alpine:3.19.0

RUN apk add --no-cache bash autossh libressl && \
    ln -s /config /root/.ssh

COPY ./entrypoint.sh /entrypoint.sh

ENV \
  LOCAL_PORT= \
  REMOTE_PORT= \
  REMOTE_HOST= \
  IDENTITY_FILE=/config/id_ed25519

ENTRYPOINT ["/entrypoint.sh"]