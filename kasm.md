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
git clone https://github.com/kasmtech/workspaces-images.git
cd workspaces-images
cp dockerfile-kasm-desktop dockerfile-kasm-desktop-custom

# sudo
RUN apt-get update \
    && apt-get install -y sudo \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/list/*

docker build -t kasmweb/desktop:custom -f dockerfile-kasm-desktop-custom .

docker run  -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    -v /home/desktop:/home/desktop \
    --name=desktop \
    kasmweb/desktop:custom
```

```
git clone https://github.com/kasmtech/workspaces-core-images.git
cd workspaces-core-images
cp dockerfile-kasm-core dockerfile-kasm-core-custom
nano dockerfile-kasm-core-custom

ARG BASE_IMAGE="ubuntu:22.04"

### sudo & chrome
RUN apt-get update \
    && apt-get install -y sudo gdebi \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/list/* \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb \
    && gdebi --n /tmp/google-chrome-stable_current_amd64.deb \
    && rm -rf /tmp/google-chrome-stable_current_amd64.deb \
    && sed -i 's|Exec=/usr/bin/google-chrome-stable %U|Exec=/usr/bin/google-chrome-stable --no-sandbox %U|g' /usr/share/applications/google-chrome.desktop \
    && sed -i 's|Exec=/usr/bin/google-chrome-stable|Exec=/usr/bin/google-chrome-stable --no-sandbox|g' /usr/share/applications/google-chrome.desktop \
    && sed -i 's|Exec=/usr/bin/google-chrome-stable --incognito|Exec=/usr/bin/google-chrome-stable --incognito --no-sandbox|g' /usr/share/applications/google-chrome.desktop

docker build -t kasmweb/core:custom -f dockerfile-kasm-core-custom .

docker run -d \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=password \
    -v /home/desktop:/home/desktop \
    --name=desktop \
    kasmweb/core:custom
```