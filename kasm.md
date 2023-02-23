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

# custom

```
git clone https://github.com/kasmtech/workspaces-core-images.git
cd workspaces-core-images

sed -i 's/ubuntu:20.04/ubuntu:22.04/g' dockerfile-kasm-core

docker build -t kasmweb/desktop:1.12.1 -f dockerfile-kasm-core .

docker run  -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    --name=desktop \
    kasmweb/desktop:1.12.1
```

```
git clone https://github.com/kasmtech/workspaces-images.git
cd workspaces-images
cp dockerfile-kasm-desktop dockerfile-kasm-desktop-custom
sed -i 's/^[^#].*firefox/#&/g' dockerfile-kasm-desktop-custom

docker run  -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    --name=desktop \
    kasmweb/desktop:1.12.1
```