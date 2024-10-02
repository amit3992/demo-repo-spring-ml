# Base Gitpod workspace image
FROM gitpod/workspace-full:latest

# Install Java (JDK) for Spring Boot
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jdk

# Install Maven (if you're using Maven for Spring Boot)
RUN sudo apt-get install -y maven

# Set JAVA_HOME environment variable (important for running Java apps)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Install Python 3 and pip (if not already installed)
RUN sudo apt-get install -y python3 python3-pip

# Install Python packages globally if needed
COPY ./player-ml-model/requirements.txt /workspace/player-ml-model/requirements.txt
RUN pip3 install -r /workspace/player-ml-model/requirements.txt

# Expose the ports for both applications
EXPOSE 8080
EXPOSE 5000

# Set default working directory to /workspace
WORKDIR /workspace