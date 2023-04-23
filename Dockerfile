FROM ubuntu 

# Standard tools installation:
RUN apt-get update \
    && apt-get install -y git \ 
    && apt-get install -y net-tools \
    && apt-get install -y build-essential

# Nmap installation
RUN apt-get install -y nmap

RUN git clone https://github.com/Pyother/SystemManagement.git

CMD ["./SystemManagement/stats.sh"]

