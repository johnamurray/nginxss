###Instructions

```bash
docker build -t nginxss .
docker run --rm -it -h tctl.local -p 443:443 --name nginx-alpine-ssl nginxss /bin/sh
```

and then test with
```bash
curl localhost
curl https://tctl.local
openssl s_client --connect tctl.local:443 -showcerts
curl https://localhost
```

and finally test from outside

```bash
```