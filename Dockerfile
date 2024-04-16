# Use the official Nginx image as the base image
FROM nginx:latest

# Copy custom configuration file from the local host into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Define the default command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
