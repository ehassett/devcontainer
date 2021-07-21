FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
COPY ./copy/* /tmp/
COPY ./bootstrap /opt/bootstrap
RUN sh /opt/bootstrap
ENTRYPOINT service ssh restart && zsh