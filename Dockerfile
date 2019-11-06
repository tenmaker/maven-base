FROM maven:3.6-jdk-8

MAINTAINER benwk

# 设置环境变量
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# 设置应用目录
WORKDIR /base
RUN mkdir -p /base
COPY . /base

# 安装依赖
RUN mvn clean package -Dmaven.test.skip=true

EXPOSE 8080
CMD ["catalina.sh","run"]
