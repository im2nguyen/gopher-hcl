FROM golang:1.12

RUN go get github.com/gopherjs/gopherjs

WORKDIR gopher-hcl
ADD main.go ./
RUN go mod init gopher-hcl
RUN go mod vendor &&  GOPATH=vendor/ gopherjs build main.go -o build.js

RUN ls vendor/github.com/hashicorp/hcl/v2

RUN GOPATH=vendor/ gopherjs build main.go -o build.js

CMD ["cat", "build.js"]
