FROM ubuntu:20.04

# Install OpenSSH + Java + tools
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    openssh-server \
    sudo \
    git \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Prepare SSH runtime directory
RUN mkdir -p /var/run/sshd

# Create Jenkins user
RUN useradd -m -d /home/jenkins -s /bin/bash jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    usermod -aG sudo jenkins

# Setup SSH for Jenkins user
RUN mkdir -p /home/jenkins/.ssh && chmod 700 /home/jenkins/.ssh && chown -R jenkins:jenkins /home/jenkins/.ssh

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
