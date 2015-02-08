haproxy -D -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid
cd /etc/haproxy
while true; do
  change=$(inotifywait -e close_write,moved_to,create .)
  change=${change#./ * }
  if [ "$change" = "haproxy.cfg" ]; then haproxy -D -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid); fi
done
