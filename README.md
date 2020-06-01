# student-list 
This repo is a simple application to list student with a webserver (PHP) and API (Flask)

## encrypt vault password
`ansible-vault encrypt vault`

## decrypt ansible password
`ansible-vault edit vault`

## deploy Gogs
Run below command

`ansible-playbook -i /opt/bitnami/jenkins/jenkins_home/workspace/deploy-gogs/deploy/ansible/inventory2 /opt/bitnami/jenkins/jenkins_home/workspace/deploy-gogs/deploy/ansible/gogs-repository-setup-playbook.yml`
