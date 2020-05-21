FROM golang:1.12

ADD main.go ./

RUN go get github.com/gopherjs/gopherjs
RUN go get github.com/hashicorp/hcl

RUN gopherjs build main.go -o build.js

CMD ["cat", "build.js"]
