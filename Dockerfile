FROM ubuntu:18.04 as build

RUN apt update && \
    apt install curl -y && \
    apt clean

# SPARK
ARG SPARK_ARCHIVE=http://apache.osuosl.org/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN curl -s $SPARK_ARCHIVE | tar -xz -C /usr/local/

FROM openjdk:8u212-jre-slim

MAINTAINER Seel 459745355@qq.com

# SPARK
COPY --from=build /usr/local/ /usr/local/

ENV SPARK_HOME /usr/local/spark-2.4.3-bin-hadoop2.7
# ENV SPARK_HOME /usr/local/spark-2.2.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin

WORKDIR "/usr/local/spark-2.4.3-bin-hadoop2.7"
