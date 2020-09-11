FROM ubuntu:20.04

# Install OpenJDK-8
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        # libicu60 \
        # libunwind8 \
        netcat \
	    wget \
	    # npm \
        unzip \
	    apt-utils \
	    default-jre \
	    default-jdk 

COPY *.sh /app/

WORKDIR /app

RUN chmod u+x run.sh 
RUN ./run.sh