# docker-ng-nginx

Angular 2 client, known as [angular-cli](https://github.com/angular/angular-cli) with Nginx

# Details

Image provides exposed port: 4200 (app), 49152 (livereload) and 80 (Nginx).

The default working directory is "/project", so you **should link you workspace to that directory** (see "How to use" section).

# How to use

To create a new project run the following:

```bash
mkdir ~/testapp
cd ~/testapp

docker run --rm -it     \
    -e APP_DEBUG = false \
    -v $(pwd):/project superbuddy/ng-cli-nginx \

docker exec -it *name* ng new "projectname"
```

Afterward you may launch the default server from command line or using docker-compose. Note that "ng" creates directory named as your project (myproject in our example), **you must link that directory or go to that directory before to continue**.

Command line example:

```bash
docker run --rm -it -u $(id -u):$(id -g) \
    -v $(pwd)/myproject:/project      \
    -p 4200:4200 -p 49152:49152 -p 80:80 \
    superbuddy/ng-cli-nginx serve

# or go to the project dir
cd myproject
docker run --rm -it -u $(id -u):$(id -g) \
    -v $(pwd):/project      \
    -p 4200:4200 -p 49152:49152 -p 80:80 \
    superbuddy/ng-cli-nginx serve
```

"`docker-compose.yml`" example file, see the "volumes" section that bind "myproject" to "/project":

```yaml
version: '2':
services:
    myproject:
        image: superbuddy/ng-cli-nginx
        environment:
        - APP_DEBUG=true
        ports:
        - 4200:4200
        - 49152:49152
        - 81:80
        volumes:
        - ./myproject:/project
```

If your "docker-compose.yml" file resides in "myproject" directory:

```yaml
version: '2':
services:
    myproject:
        image: superbuddy/ng-cli-nginx
        environment:
        - APP_DEBUG=true
        ports:
        - 4200:4200
        - 49152:49152
        - 81:80
        volumes:
        - ./:/project
```

