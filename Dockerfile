FROM golang:alpine as build

WORKDIR /go/src/app

COPY . /go/src/app

RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static" -w -s' -tags timetzdata cmd/main.go 

FROM scratch

COPY --from=build /go/src/app/main /main
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["/main"]
