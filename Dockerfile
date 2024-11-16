FROM golang:1.21 AS buildimage

WORKDIR /go/src/app

COPY . ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /app ./...

CMD ["app"]

FROM scratch

COPY --from=buildimage / /
CMD ["/app"]