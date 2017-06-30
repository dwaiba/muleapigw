FROM java:openjdk-8-jdk

MAINTAINER dbanerj@gmail.com

RUN cd ~ && wget https://s3.amazonaws.com/static-anypoint-mulesoft-com/api-gateway-distribution-standalone-2.2.0.zip && echo "3387e89142fdb377ffd27d2ab04b1299 api-gateway-distribution-standalone-2.2.0.zip" | md5sum -c

RUN cd /opt && unzip ~/api-gateway-distribution-standalone-2.2.0.zip && rm -rf ~/api-gateway-distribution-standalone-2.2.0.zip && ln -s /opt/api-gateway-standalone-2.2.0 /opt/muleapigw
EXPOSE 7777
EXPOSE 32001
EXPOSE 8081
CMD ["/opt/muleapigw/bin/./gateway", "start"]
