FROM java:8
VOLUME /tmp
ADD eureka-server-1.0-SNAPSHOT.jar eureka.jar
RUN sh -c 'touch /eureka.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar eureka.jar" ]
