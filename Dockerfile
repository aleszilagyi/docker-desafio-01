FROM golang:1.18.2-alpine3.15 as support
WORKDIR /go/src

COPY ["main.go", "go.mod", "./"]

RUN go build -o app

FROM scratch as base

COPY --from=support /go/src/app .

ENTRYPOINT ["./app"]