# DOCKER-VERSION 0.3.4
FROM        perl:latest
MAINTAINER  Simon Proctor simon.proctor@gmail.com

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

#RUN cachebuster=7 git clone https://github.com/Scimon/docker-dancer-rest-test.git
COPY app docker-dancer-rest-test
RUN cd docker-dancer-rest-test && carton install --deployment

EXPOSE 8080

WORKDIR docker-dancer-rest-test
CMD carton exec starman --port 8080 bin/app.pl
