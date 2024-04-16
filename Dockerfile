# Use a lightweight base image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Copy the application binary from the heptio-images repository
COPY ./guestbook-ui /app

# Expose the port the app runs on
EXPOSE 80

# Command to run the application
CMD ["./guestbook-ui"]
