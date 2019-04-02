创建volume
```bash
docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.101.79,rw \
    --opt device=:/mnt/nfs-1 \
    maxwin_nfs-1
```
客户端需要安装nf-common
> apt install nfs-common

测试用例70上：docker-compose.yml 在/var/maxwin下
```bash
version: '2'
services:
  mis-ui:
    image: nginx
    container_name: mis-ui
    ports:
      - 8012:80
    volumes:
      - ./default_mis.conf:/etc/nginx/conf.d/default.conf
      - nfs-1:/media
      - /usr/share/zoneinfo/Asia/Taipei:/usr/share/zoneinfo/Asia/Taipei
      - /usr/share/zoneinfo/Asia/Taipei:/etc/localtime/
      - /etc/timezone:/etc/timezone
    working_dir: /media
    restart: always
    logging:
       driver: "json-file"
       options:
         max-size: "50m"
         max-file: "10"
volumes:
  nfs-1:
    driver: local
```
