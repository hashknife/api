FROM golang:1.9 as builder
WORKDIR /go/src/github.com/hashknife/api
COPY . /go/src/github.com/hashknife/api
RUN make build
FROM centurylink/ca-certs
EXPOSE 9988
EXPOSE 9989
COPY --from=builder /go/src/github.com/hashknife/api/bin/api .
COPY config.json /root/
ENTRYPOINT ["/hashknife-api", "-c", "config.json"]
