FROM debian:sid

RUN \
  apt-get update && \
  apt-get install -y haproxy inotify-tools && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy

COPY ./watch_config.sh /opt/haproxy/

CMD ["/bin/bash", "/opt/haproxy/watch_config.sh"]
