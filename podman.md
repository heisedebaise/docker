# install

```
dnf install -y podman
```

# create pod

```
podman pod create \
    -p 8080:8080 \
    --name=local
```