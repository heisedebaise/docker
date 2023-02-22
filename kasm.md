# chrome

```
docker run  -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    --name=chrome \
    kasmweb/chrome:1.12.0
```

# desktop

```
docker run  -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    --name=desktop \
    kasmweb/desktop:1.12.0
```