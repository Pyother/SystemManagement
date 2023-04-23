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

# Python installation:
RUN apt-get install -y python3

# Lua installation:
RUN apt-get install lua5.3 

# Node.js installation:
RUN apt-get install -y nodejs

# HTTP server installation:
RUN apt-get install -y npm 
RUN npm install -g http-server

ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/Pyother/SystemManagement.git

CMD ["./SystemManagement/stats.sh"]

