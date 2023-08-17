package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net"

	pb "server/proto"

	"github.com/go-redis/redis/v8"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
)

const (
    port = ":3000"
    redisAddr = "localhost:6379"
    redisPass = ""
    DB = 0
)

func NewRedisClient() *redis.Client {
    client := redis.NewClient(&redis.Options{
        Addr: redisAddr,
        Password: redisPass,
        DB: DB,
    })

    return client
}


type MessangerServer struct {
    
}

func (s *MessangerServer) SendMessage(ctx context.Context, request *pb.MessageSendRequest) (*pb.MessageSendResponse, error) {
    log.Printf("Received: %v", request.Body);

    if request.CreatedAt == nil {
        request.CreatedAt = timestamppb.Now()
    }

    message, _ := json.Marshal(request)
    client := NewRedisClient()
    err := client.Publish(ctx, "1", message).Err();
    if err != nil {
        println(err);
    }

    return &pb.MessageSendResponse{Result: true}, nil;
}

func (s *MessangerServer) GetMessages(_ *emptypb.Empty, stream pb.Messanger_GetMessagesServer) error {
    client := NewRedisClient()
    pubsub := client.Subscribe(stream.Context(), "1");
    defer pubsub.Close();

    _, err := pubsub.Receive(stream.Context());
    if err != nil {
        log.Fatal(err)
    }

    ch := pubsub.Channel();

    for msg := range ch {
        var message pb.Message;
        err := json.Unmarshal([]byte(msg.Payload), &message);
        if err != nil {
            log.Fatal(err)
        }
        fmt.Println(msg.Channel, msg.Payload);

        if err := stream.Send(&message); err != nil {
            return err
        }
    }
    return nil;
}

func main() {
    lis, err := net.Listen("tcp", port)

    if err != nil {
        log.Fatalf("failed to listen: %v", err)
    }
    grpcServer := grpc.NewServer()

    pb.RegisterMessangerServer(grpcServer, &MessangerServer{})

    fmt.Println("Go gRPC server running!")

    if err := grpcServer.Serve(lis); err != nil {
        log.Fatalf("failed to serve: %s", err)
    }
}