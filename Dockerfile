FROM yoshz/apache-php:5.5

ENV GITHUB_TOKEN=fc1541eddbd36e61f631327ed59a85a6d76a6002
ENV ENVIRONMENT=docker

COPY ["sites-enabled/vhost.conf", "/etc/apache2/sites-enabled/"]
COPY ["start_script.sh", "/"]

RUN chmod +x /start_script.sh
RUN mkdir /log-dev-docker.dev
RUN chmod 777 /log-dev-docker.dev

WORKDIR /var/www/html/

CMD /start_script.sh
