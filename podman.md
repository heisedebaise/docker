
```
dnf install podman
```

```
podman pod create \
    -p 8080:8080 \
    --name=localhost
```