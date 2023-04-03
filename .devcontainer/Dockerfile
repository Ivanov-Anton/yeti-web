FROM debian:buster

# Install SSH server and Git
RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server git \
    && rm -rf /var/lib/apt/lists/*

# Enable the SSH server
RUN mkdir /run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && echo "root:password" | chpasswd

# Set the default shell to bash
ENV SHELL /bin/bash

# Expose SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]
