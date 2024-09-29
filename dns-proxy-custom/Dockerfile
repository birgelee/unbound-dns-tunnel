FROM ubuntu:latest

ARG GO_VERSION
ENV GO_VERSION=${GO_VERSION}

RUN apt-get update
RUN apt-get install -y wget git gcc build-essential

RUN wget -P /tmp "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz"

RUN tar -C /usr/local -xzf "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"
RUN rm "/tmp/go${GO_VERSION}.linux-amd64.tar.gz"

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Install debug tools
RUN apt-get install -y dnsutils tcpdump vim

WORKDIR $GOPATH

RUN git clone https://github.com/LINKIWI/dotproxy.git

WORKDIR dotproxy
RUN go mod download
#RUN go mod download github.com/certifi/gocertifi
#RUN go mod download golang.org/x/tools
#go get -d ./...
#RUN make

#RUN ./bin/dotproxy-$OS-$ARCH --help