FROM python:wheezy
MAINTAINER Pryz <ju.pryz@gmail.com>

RUN pip install mkdocs

EXPOSE 8000

VOLUME "/content"
WORKDIR "/content"

CMD ["mkdocs", "serve"]
