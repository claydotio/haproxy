watches config at `/etc/haproxy/haproxy.cfg`

```
docker run
    --restart always
    --name haproxy
    -v /var/log:/var/log
    -v /etc/haproxy:/etc/haproxy
    -d
    -p 50001:50001
    -p 50002:50002
    -p 50003:50003
    -p 50004:50004
    ...
    -p 1937:1937
    -t clay/haproxy
```
