FROM golang:1.9 as builder
COPY ./ /go/src/github.com/briandowns/hashknife/hashknife-api/
RUN go get -u -v github.com/go-kit/kit/... && \
    go get -u -v github.com/gorilla/mux && \
    go get -u -v github.com/gorilla/handlers && \
    go get -u -v github.com/garyburd/redigo/... && \
    go get -u -v github.com/stretchr/testify/suite
RUN cd /go/src/github.com/briandowns/hashknife/hashknife-api/ && \
    go build -o hashknife-api -v .
FROM centurylink/ca-certs
WORKDIR /
EXPOSE 9988
EXPOSE 9989
COPY --from=builder /gocode/src/github.com/briandowns/hashknife/hashknife-api/bin/hashknife-api .
COPY config.json /
ENTRYPOINT ["/hashknife-api", "-c", "config.json"]
