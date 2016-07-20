FROM python:3.4

EXPOSE 8000
RUN pip install mkdocs && pip install mkdocs-material

RUN mkdir /site
WORKDIR /site

CMD mkdocs serve
