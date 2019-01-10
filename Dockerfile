############################
# STEP 1 build executable binary
############################

FROM golang:alpine AS builder

RUN apk add --no-cache git \
    && go get github.com/gin-gonic/gin \
    && apk del git

WORKDIR /go/src/app
COPY ./src .
RUN go build -o /go/bin/app


############################
# STEP 2 build a small image
############################

FROM scratch
COPY --from=builder /go/bin/app /go/bin/app
ENTRYPOINT ["/go/bin/app"]