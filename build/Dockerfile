# Use the official Golang image as a base image
FROM golang:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY src/ .

# Run tests
RUN go test ./...

# Build the Go application
RUN go build -o main .

# Create a new stage to create a lightweight image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the built executable from the builder stage
COPY --from=builder /app/main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]
