from ubuntu:trusty
RUN apt-get update && apt-get install -y libncurses5-dev fop openjdk-6-jdk unixodbc-dev g++ libssl-dev gcc make openssl wget && apt-get clean -y
RUN wget http://www.erlang.org/download/otp_src_19.2.tar.gz 
RUN tar -zxf otp_src_19.2.tar.gz && cd otp_src_19.2
WORKDIR /otp_src_19.2
ENV ERL_TOP /otp_src_19.2
RUN  ./configure && make && make install
ADD hackney_ssl_test* /
