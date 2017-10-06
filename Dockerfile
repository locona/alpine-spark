FROM alpine:3.6 AS build-env

ENV SPARK_HOME /usr/local
RUN apk add --no-cache --update bash wget && \
    mkdir -p "${SPARK_HOME}" && \
    wget -qO - --no-check-certificate "https://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.6.tgz" | tar xz -C ${SPARK_HOME} --strip-components=1 && \
    apk del wget

FROM busybox:latest AS storage
COPY --from=build-env /usr/local/bin /usr/local/bin
