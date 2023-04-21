FROM ubuntu 

# Standard tools installation:
RUN apt-get update \
    && apt-get install -y git \ 
    && apt-get install -y net-tools \
    && apt-get install -y build-essential

# Rust installation:
RUN apt-get install -y curl \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup.sh \
    && sh rustup.sh -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/Pyother/SystemManagement.git
RUN ./SystemManagement/systemmonitor.sh



