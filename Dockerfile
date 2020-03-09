FROM apache/nifi:1.9.0

USER root
RUN mkdir /lib/jdbc
WORKDIR /lib/jdbc

RUN wget https://download.microsoft.com/download/4/0/8/40815588-bef6-4715-bde9-baace8726c2a/sqljdbc_8.2.0.0_enu.tar.gz
RUN tar xvzf sqljdbc_8.2.0.0_enu.tar.gz
RUN cp ./sqljdbc_8.2/enu/mssql-jdbc-8.2.0.jre8.jar ./

RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.10.jar


ENV NIFI_WEB_HTTP_HOST 0.0.0.0
ENV NIFI_CLUSTER_ADDRESS 0.0.0.0
ENV NIFI_WEB_PROXY_CONTEXT_PATH nifibigdata

USER nifi

EXPOSE 8080

WORKDIR ${NIFI_HOME}
COPY bootstrap.conf /opt/nifi/nifi-current/conf
COPY nifi.properties /opt/nifi/nifi-current/conf
COPY logback.xml /opt/nifi/nifi-current/conf
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
ENTRYPOINT ["../scripts/start.sh"]
