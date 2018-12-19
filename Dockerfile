FROM golang:alpine

WORKDIR /go/src/app
COPY ./src .

RUN apk add --no-cache git \
    && go get github.com/gin-gonic/gin \
    && apk del git

CMD ["go", "run", "app"]

