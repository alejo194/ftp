vi docker-compose.yml
```bash
version: '2'
services:
  vsftpd:
    image: fauria/vsftpd
    container_name: vsftpd
    restart: always
    ports:
      - 20-21:20-21
      - 21100-21110:21100-21110
    environment:
      - FTP_USER=myuser
      - FTP_PASS=mypass
      - PASV_ADDRESS=192.168.101.73 ##被动式
      - PASV_MIN_PORT=21100
      - PASV_MAX_PORT=21110
      - FILE_OPEN_MODE=0777
    volumes:
      - ./vsftpd:/home/vsftpd
    logging:
          driver: "json-file"
          options:
             max-size: "50m"
             max-file: "10"
```
另一个
```bash
vi docker-compose.yaml
version: '2'

services:
  ftpd_server:
    image: stilliard/pure-ftpd:hardened
    container_name: pure-ftpd
    ports:
      - "21:21"
      - "30000-30009:30000-30009"
    volumes:
      - "/var/maxwin/test_ftp/data:/home/ftpusers/"
      - "/var/maxwin/test_ftp/passwd:/etc/pure-ftpd/passwd"
      - "/var/maxwin/test_ftp/ssl:/etc/ssl/private/"
    environment:
      PUBLICHOST: "localhost"
#      ADDED_FLAGS: "--tls=2"
    command: ["/bin/sh", "-c", "/run.sh -c 5 -C 5 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R  -P 192.168.101.70 -p 30000:30009 -s -A -j -Z -H -4 -E -R -G -X -x"]
    restart: always
```
参见：https://www.cnblogs.com/HD/p/5664394.html
