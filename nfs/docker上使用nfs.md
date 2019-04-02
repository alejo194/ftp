创建volume
```bash
docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.101.79,rw \
    --opt device=:/path/to/dir \
    foo
```
