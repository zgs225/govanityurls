FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN go build -mod=vendor

FROM alpine:3.16

WORKDIR /app

COPY --from=build /app/govanityurls /app/vanity.yaml /app

CMD ["/app/govanityurls"]
