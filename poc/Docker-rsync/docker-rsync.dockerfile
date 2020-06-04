#--- Alpine build container ---
FROM alpine:latest

RUN apk --update --no-cache add rsync

RUN mkdir -p /etc/rsync && \
    touch /var/run/rsync.lock && \
    touch /var/log/rsync.log && \
    mkdir -p /home/rsync/


EXPOSE 873

STOPSIGNAL SIGTERM

#CMD ["rsync", "--daemon"]
ENTRYPOINT ["rsync", "--daemon", "--no-detach", "--verbose"]

#ENTRYPOINT ["tini", "-g", "--", "rsync"]
#CMD ["--daemon]
