#!/bin/sh

set -xe

SERVER_OUTPUT_DIR=/output/server
CLIENT_OUTPUT_DIR=/output/client

protoc --version
protoc-gen-go --version

protoc --proto_path=. --proto_path=vendor/protobuf/src messenger.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --go_out=${SERVER_OUTPUT_DIR} --go-grpc_out=require_unimplemented_servers=false:${SERVER_OUTPUT_DIR} --dart_out=grpc:${CLIENT_OUTPUT_DIR} 
