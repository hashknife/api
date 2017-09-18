FROM golang:1.9 as builder
WORKDIR /go/src/github.com/hashknife/api
COPY . /go/src/github.com/hashknife/api
RUN make build
FROM centurylink/ca-certs
EXPOSE 9988
EXPOSE 9989
COPY --from=builder /go/src/github.com/hashknife/api/bin/api /api
COPY config.json /config.json
ENTRYPOINT ["/api", "-c", "config.json"]
