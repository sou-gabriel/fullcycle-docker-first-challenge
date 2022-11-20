FROM golang AS build

WORKDIR /usr/app

COPY main.go .

RUN go mod init challange/main

RUN go build main.go

FROM scratch

WORKDIR /usr/app

COPY --from=build /usr/app/main .

CMD ["./main"]