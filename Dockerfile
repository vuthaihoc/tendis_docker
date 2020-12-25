FROM ubuntu:20.04

WORKDIR /tendis

ADD https://github.com/vuthaihoc/tendis_docker/releases/download/init/tendisplus-2.1.2-rocksdb-v5.13.4.tgz /tendis/

RUN tar -xf tendisplus-2.1.2-rocksdb-v5.13.4.tgz && \
	mv tendisplus-2.1.2-rocksdb-v5.13.4/* ./ && \
	rm -rf tendisplus-2.1.2-rocksdb-v5.13.4* && \
	rm -rf bin/tendisplus_static

COPY ./scripts /tendis/scripts

WORKDIR /tendis/scripts

ENTRYPOINT /tendis/scripts/start.sh

CMD ['/tendis/scripts/tendisplus.conf']

EXPOSE 51002

VOLUME /tendis_data