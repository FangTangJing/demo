FROM k8sre/jdk:8u252

COPY run.sh         /

RUN apk update                             && \
    apk upgrade                            && \
    chmod 755 /run.sh

COPY target/demo-java-service-0.0.2.jar /opt/demo.jar

ENTRYPOINT ["/run.sh"]