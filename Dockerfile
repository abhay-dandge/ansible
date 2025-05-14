
# Base image
FROM ubuntu:20.04

# Set non-interactive for smooth installation
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenSSH server and sudo
RUN apt update && apt install -y openssh-server sudo

# Create the SSH directory and user
RUN mkdir /var/run/sshd \
    && useradd -m -s /bin/bash ubuntu \
    && echo 'ubuntu:ubuntu' | chpasswd \
    && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enable password authentication
RUN sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Keep SSH running in the foreground
CMD ["/usr/sbin/sshd", "-D"]
