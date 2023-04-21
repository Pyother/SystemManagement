FROM ubuntu 

RUN apt-get update \
 && apt-get install -y git \ 
 && apt-get install -y net-tools

RUN git clone https://github.com/Pyother/SystemManagement.git
RUN ./SystemManagement/systemmonitor.sh



