FROM ubuntu 

# Standard tools installation:
RUN apt-get update \
    && apt-get install -y git \ 
    && apt-get install -y net-tools \
    && apt-get install -y build-essential

# Nmap installation
RUN apt-get install -y nmap

# BATS installation:
RUN apt-get install -y bats

COPY . /app
RUN cd /app
RUN git clone https://github.com/Pyother/SystemManagement.git
WORKDIR /app 

CMD ["sh", "-c", "if [ -t 0 ]; then /bin/bash; else ./stats.sh; fi"]


