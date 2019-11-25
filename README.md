This image is a read only webdav server

Build:
```
docker build --tag machines/webdav_server .
```

Start:
```
docker run --name webdav_server -p 4001:80 -v ./:/var/www/html machines/webdav_server
```

