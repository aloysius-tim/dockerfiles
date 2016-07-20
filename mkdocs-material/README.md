# Mkdocs #
[mkdocs](http://www.mkdocs.org/) is a python based documentation system that utilizes a series of markdown files to build a well formated site that is focused on documentation.

### Run ###
This requires the use of volumes to mount the document folder.
```shell
docker run -d -p 8000:8000 --name documents -v /path/to/documents:/documents moird/mkdocs
```

### Mkdocs Initialization ###
Mkdocs can be initialized with the container, it doesn't need to be started first.
```shell
docker run -v /documents moird/mkdocs mkdocs new .
```

### Mkdocs Configuration ###
the mkdocs.yaml file is the primary source of configuration for mkdocs, you can specify the pages layout, and additional settings like port.  It is suggested to set at least the dev_addr to 9010:
```
dev_addr: 0.0.0.0:8000
```
The site files can also be configured to be built and served from /site
```
site_dir: /site
```

For example the entire file might look like this:
```
site_name: Dockerfile Documentation
repo_url: https://github.com/moird/dockerfiles
dev_addr: 0.0.0.0:8000
site_dir: /site

pages:
  - index.md
```
