# Dockerfile for building Apache Mahout image
# author: Micha Birklbauer

FROM openjdk:8
# alternatively run all commands in interactive shell
# e.g. docker run -it openjdk:8

LABEL maintainer="micha.birklbauer@gmail.com"

RUN mkdir apache
# in shell run "cd apache" instead
WORKDIR apache

# Getting Apache Mahout - this is my own fork since it needed some tuning
RUN wget -nv https://github.com/michabirklbauer/mahout/archive/mahout-14.2.tar.gz
RUN tar -xzvf mahout-14.2.tar.gz > tmp
RUN rm mahout-14.2.tar.gz
RUN mv mahout-mahout-14.2 mahout
# in shell run "export MAHOUT_HOME=/apache/mahout" instead
ENV MAHOUT_HOME=/apache/mahout

# Getting Apache Maven
RUN wget -nv https://mirror.klaus-uwe.me/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xzvf apache-maven-3.6.3-bin.tar.gz >> tmp
RUN rm apache-maven-3.6.3-bin.tar.gz
RUN mv apache-maven-3.6.3/ maven
# in shell run "export MAVEN_HOME=/apache/maven" instead
ENV MAVEN_HOME=/apache/maven

# Building Mahout with Maven
# in shell run "cd mahout" instead
WORKDIR mahout
RUN  bash /apache/maven/bin/mvn clean install -DskipTests > maven_install_logfile.txt
# in shell run "cd .." instead
WORKDIR ..

# Getting Apache Hadoop
RUN wget -nv https://mirror.klaus-uwe.me/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz
RUN tar -xzvf hadoop-3.2.1.tar.gz > tmp
RUN rm hadoop-3.2.1.tar.gz
RUN mv hadoop-3.2.1/ hadoop
# in shell run "export HADOOP_HOME=/apache/hadoop" instead
ENV HADOOP_HOME=/apache/hadoop

# Getting Apache Spark
RUN wget -nv https://mirror.klaus-uwe.me/apache/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
RUN tar -xzvf spark-3.0.1-bin-hadoop3.2.tgz >> tmp
RUN rm spark-3.0.1-bin-hadoop3.2.tgz
RUN mv spark-3.0.1-bin-hadoop3.2/ spark
# in shell run "export SPARK_HOME=/apache/spark" instead
ENV SPARK_HOME=/apache/spark

# Running Mahout with Spark
CMD ["./mahout/bin/mahout", "spark-shell"]
