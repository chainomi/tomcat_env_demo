
FROM httpd:2.4

RUN apt-get update -y && set -x 

WORKDIR /usr/local/apache2/htdocs/   

COPY ${FILE_NAME} /usr/local/apache2/htdocs/

#COPY /home/ec2-user/Docker_env_demo/${FILE_NAME} /usr/local/apache2/htdocs/

EXPOSE ${CONT_PORT}
