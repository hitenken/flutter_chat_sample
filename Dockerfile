FROM golang:1.18

ENV DEBIAN_FRONTEND=noninteractive

ARG PROTO_VERSION=21.2

WORKDIR /proto

COPY ./proto .

RUN mkdir /output /output/server /output/client && apt-get -qq update && apt-get -qq install -y unzip && \
  curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-linux-x86_64.zip -o protoc.zip && \
  unzip -qq protoc.zip && \
  cp ./bin/protoc /usr/local/bin/protoc && \
  cp -r ./include /usr/local

# Go
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

# Dart
ARG DART_VERSION=2.17.5
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && apt-get install -y --no-install-recommends tzdata && \
    apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates clang cmake curl file git libglu1-mesa libgtk-3-dev ninja-build pkg-config unzip xz-utils zip && \
    curl https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-x64-release.zip -o /tmp/dart-sdk.zip && \
    unzip /tmp/dart-sdk.zip -d /usr/lib && rm /tmp/dart-sdk.zip
ENV PATH=/usr/lib/dart-sdk/bin:$PATH
ENV PATH=/root/.pub-cache/bin:$PATH
RUN dart pub global activate protoc_plugin

