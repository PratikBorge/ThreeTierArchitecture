FROM centos:7
LABEL engg="pratborge"

USER root 

RUN yum install httpd -y
RUN chmod 777 /var/www/html

COPY proxy.conf /etc/httpd/conf.d/proxy.conf
COPY index.html /var/www/html/index.html
RUN chmod 664 /var/www/html/index.html

EXPOSE 80 
CMD httpd -DFOREGROUND

