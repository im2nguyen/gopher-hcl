FROM golang:1.12

RUN go get github.com/gopherjs/gopherjs

WORKDIR gopher-hcl
ADD main.go ./
RUN go mod init gopher-hcl
RUN go mod vendor

RUN ls vendor/github.com/hashicorp/hcl/v2
RUN mkdir -p /go/src/github.com/hashicorp/hcl
RUN cp vendor/github.com/hashicorp/hcl/v2 /go/src/github.com/hashicorp/hcl

RUN gopherjs build main.go -o build.js -mod=vendor

CMD ["cat", "build.js"]
