FROM centos:7

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN yum install -y curl ca-certificates fontconfig

ENV JAVA_VERSION jdk-11.0.4+11_openj9-0.15.1

RUN curl -LfsSo /tmp/openjdk.tgz https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11_openj9-0.15.1/OpenJDK11U-jre_x64_linux_openj9_11.0.4_11_openj9-0.15.1.tar.gz; \
    mkdir -p /opt/java/openjdk; cd /opt/java/openjdk; tar -zxf /tmp/openjdk.tgz --strip-components=1; \
    rm -rf /tmp/openjdk.tgz; \
    curl -LfsSo /tmp/skywalking.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/skywalking/6.4.0/apache-skywalking-apm-6.4.0.tar.gz; \
    mkdir -p /opt/skywalking; cd /opt/skywalking; tar -zxf /tmp/skywalking.tgz --strip-components=1 apache-skywalking-apm-bin/agent; \
    rm -rf /tmp/skywalking.tgz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle"
