FROM golang:1.12

WORKDIR gopher-hcl
ADD main.go ./
RUN go mod init gopher-hcl
RUN go mod vendor

RUN gopherjs build main.go -o build.js

CMD ["cat", "build.js"]
