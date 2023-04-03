# Use the official Debian Buster image as the base image
FROM debian:buster

# Set the working directory to /workspace
WORKDIR /workspace

# Install the required packages for your project
RUN apt-get update && \
    apt-get install -y package1 package2 package3

# Clean up the package cache to reduce the image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
