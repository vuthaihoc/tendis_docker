FROM ubuntu:20.04

WORKDIR /tendis

COPY ./bin /tendis/bin
COPY ./scripts /tendis/scripts

WORKDIR /tendis/scripts

ENTRYPOINT /tendis/scripts/start.sh

CMD ['/tendis/scripts/tendisplus.conf']

EXPOSE 51002

VOLUME /tendis_data