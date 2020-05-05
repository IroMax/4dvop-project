FROM python:2.7-stretch
LABEL maintainer="ROMAIN CHETAN-JEAN-PASCAL for 4DVOP project"

WORKDIR /usr/src/app
RUN pwd
RUN ls /usr/src/app
COPY . /usr/src/app
COPY ./student_age.py .
COPY ./student_age.json /data/

RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask flask_httpauth flask_simpleldap python-dotenv

CMD [ "python", "./student_age.py" ]

EXPOSE 5000
