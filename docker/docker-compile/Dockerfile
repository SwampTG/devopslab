FROM openjdk:8-jdk-alpine

RUN addgroup -S notes && adduser -S notes -G notes
ENV MAVEN_VERSION 3.5.4
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn && \
  apk --update add git

ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

WORKDIR /opt/note
RUN git clone https://github.com/SwampTG/spring-boot-mysql-rest-api-tutorial.git /opt/note && \
  chown -R notes:notes /opt/note
USER notes:notes
RUN mvn package -DskipTests

RUN cp ./target/easy-notes-1.0.0.jar easy-note.jar
ARG JAR_FILE=*.jar

COPY application.properties application.properties
ENTRYPOINT ["java", "-jar", "/opt/note/easy-note.jar"]
