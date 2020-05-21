FROM golang:1.12

RUN go get github.com/gopherjs/gopherjs

WORKDIR gopher-hcl
ADD main.go ./
RUN go mod init gopher-hcl
RUN go mod vendor

RUN mkdir -p /go/src
RUN cp -R vendor/* /go/src/

RUN gopherjs build main.go -o build.js

CMD ["cat", "build.js"]
