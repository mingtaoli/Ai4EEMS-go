FROM golang:1.23-alpine3.20 as go-builder
WORKDIR /Ai4EEMS-go

COPY ../../../.. ./
RUN go mod download && go mod tidy

WORKDIR /Ai4EEMS-go/app/mediaprop/cmd/api
RUN go build -o /mediaprop mediaprop.go

FROM alpine:3.20
WORKDIR /app

COPY --from=go-builder /mediaprop /app/
COPY --from=go-builder /Ai4EEMS-go/app/mediaprop/cmd/api/etc /app/etc

ENTRYPOINT ["/app/mediaprop"]
