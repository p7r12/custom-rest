# We need a golang build environment first
FROM golang:1.18.2-alpine3.15

WORKDIR /go/src/app
ADD hello.go /go/src/app

RUN go build hello.go

# We use a Docker multi-stage build here in order that we only take the compiled go executable
FROM alpine:3.14

LABEL org.opencrntainers.image.source="https://github.com/p7r12/custom-rest-template"

COPY --from=0 "/go/src/app/hello" hello

ENTRYPOINT ./hello



