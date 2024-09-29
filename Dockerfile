FROM mvance/unbound:latest

WORKDIR src
RUN apt update
RUN apt install -y automake zlib1g-dev libpthread-stubs0-dev libbz2-dev liblzma-dev liblzo2-dev liblz4-dev libzstd-dev libtool build-essential libcurl4-openssl-dev librdkafka-dev curl
RUN curl -LO https://github.com/LibtraceTeam/wandio/archive/refs/tags/4.2.4-1.tar.gz
RUN tar zxf 4.2.4-1.tar.gz
WORKDIR wandio-4.2.4-1
RUN ./bootstrap.sh
RUN ./configure
RUN make
RUN make install
RUN ldconfig
WORKDIR /src
RUN curl -LO https://github.com/CAIDA/libbgpstream/releases/download/v2.2.0/libbgpstream-2.2.0.tar.gz
RUN tar zxf libbgpstream-2.2.0.tar.gz
WORKDIR libbgpstream-2.2.0
RUN sed -i 's/pthread_yield/sched_yield/g' configure
RUN ./configure
RUN make
RUN make install
RUN ldconfig

WORKDIR /bgp-stream

CMD tail -f /dev/null