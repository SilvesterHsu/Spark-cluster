FROM ubuntu:18.04

MAINTAINER Seel 459745355@qq.com

#
RUN apt-get update
RUN apt-get install curl nano tree -y

# COPY Files
COPY . /root/

# JAVA
RUN chmod 777 /root/install_java.sh
RUN /root/install_java.sh
RUN java -version

# SPARK
# ARG SPARK_ARCHIVE=http://apache.spinellicreations.com/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
ARG SPARK_ARCHIVE=http://apache.osuosl.org/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
# ARG SPARK_ARCHIVE=https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
RUN curl -s $SPARK_ARCHIVE | tar -xz -C /usr/local/

ENV SPARK_HOME /usr/local/spark-2.4.3-bin-hadoop2.7
# ENV SPARK_HOME /usr/local/spark-2.2.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin

WORKDIR "/usr/local/spark-2.4.3-bin-hadoop2.7"
