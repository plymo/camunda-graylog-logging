FROM camunda/camunda-bpm-platform:tomcat-7.9.0

# Remove the slf4j-jdj14 bridge library that is packaged with CamundaBPM tomcat distribution
RUN rm -rf /camunda/lib/slf4j-jdk14-1.7.7.jar

# Add logback configuration
RUN mkdir /camunda/conf/logback
COPY conf /camunda/conf/logback/logback.xml

# Overwrite global logging configuration for tomcat
COPY conf /camunda/conf/logging.properties

# Copy Jar for logging
COPY lib /camunda/lib/jul-to-slf4j-1.7.7.jar
COPY lib /camunda/lib/logback-core-1.2.3.jar
COPY lib /camunda/lib/logback-classic-1.2.3.jar
COPY lib /camunda/lib/logback-gelf-1.1.0.jar

# Overwrite setenv.sh with additional CLASSPATH config that exposes the libraries at tomcat startup
COPY bin /camunda/bin/setenv.sh

EXPOSE 8080 8080