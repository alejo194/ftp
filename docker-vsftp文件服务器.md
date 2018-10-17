vi docker-compose.yml

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
      - PASV_ADDRESS=192.168.101.73
      - PASV_MIN_PORT=21100
      - PASV_MAX_PORT=21110
    volumes:
      - ./vsftpd:/home/vsftpd
    logging:
          driver: "json-file"
          options:
             max-size: "50m"
             max-file: "10"
