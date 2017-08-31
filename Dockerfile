FROM java:openjdk-8u111-jre-alpine
MAINTAINER DiamondYuan <541832074@qq.com>

ENV KM_VERSION=1.3.3.13 \
    KM_CONFIGFILE="conf/application.conf"

RUN apk add --no-cache git wget bash && \
    mkdir -p /tmp && \
    cd /tmp && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /tmp/kafka-manager && \
    git checkout ${KM_VERSION} && \
    echo 'scalacOptions ++= Seq("-Xmax-classfile-name", "200")' >> build.sbt && \
    ./sbt clean dist
    
EXPOSE 9000