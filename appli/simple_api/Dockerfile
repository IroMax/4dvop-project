FROM python:2.7-stretch
LABEL maintainer="ROMAIN CHETAN-JEAN-PASCAL for 4DVOP project"

COPY /opt/bitnami/jenkins/jenkins_home/workspace/4dvop-project_playbookv2/simple_api /usr/src/app
COPY /opt/bitnami/jenkins/jenkins_home/workspace/4dvop-project_playbookv2/simple_api/student_age.py .
COPY /opt/bitnami/jenkins/jenkins_home/workspace/4dvop-project_playbookv2/simple_api/student_age.json /data/

RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask flask_httpauth flask_simpleldap python-dotenv

CMD [ "python", "./student_age.py" ]

EXPOSE 5000
