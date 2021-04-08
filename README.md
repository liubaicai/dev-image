# dev image
development environment docker image base ubuntu

- docker
- nodejs
- vue 
- ruby
- golang

``` shell
docker build -f Dockerfile_ubuntu . -t dev
```

``` shell
docker run -ti --rm --privileged --name dev -v /d/ws:/workspace -p 80:80 dev
```

``` shell
docker exec -it dev bash
```