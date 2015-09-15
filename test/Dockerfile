FROM ubuntu:14.04

COPY proxy.sh .
RUN chmod +x ./proxy.sh
RUN sh ./proxy.sh
RUN apt-get update && apt-get install -y firefox
                                             

