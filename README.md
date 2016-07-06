# Docker

## Installation

Create your machine using `createmachine.sh <MACHINENAME>`.

Then set your docker environment to this machine:

```bash
eval $(docker-machine env MACHINENAME)
```

Update your docker machine with latest docker (if using beta):

```bash
docker-machine ssh MACHINE
curl -sSL https://get.docker.com/ | sudo bash
```

Before running compose make sure to create directory and move files:

```bash
docker-machine ssh NAMEOFMACHINE mkdir data
docker-machine scp admin_passwords.conf NAMEOFMACHINE:~/
docker-machine scp nginx.conf NAMEOFMACHINE:~/
docker-machine scp user_passwords.conf NAMEOFMACHINE:~/
docker-machine scp -r certs NAMEOFMACHINE:~/
```

Set the environment to contain:

- `DOCKERHOME` which should be `/home/ubuntu`
- `AWS_ACCESS_KEY_ID` to your key
- `AWS_SECRET_ACCESS_KEY` to your secret

Build the docker services:

```bash
gulp docker:build
```

Run compose to create services:

```bash
docker-compose -f docker-compose.yml -f docker-compose-services.yml up
```


## Passwords

- admin: `admin:pp123`

## Security Groups

Make sure the security groups are open:

- 80
- 8080 - 8081
- 15672

## URLS

- Web: http://DOMAIN:80
- Kibana: http://DOMAIN:8080
- ElasticSearch: http://DOMAIN:8081
- RabbitMQ: http://DOMAIN:15672 (use `admin:yousuck` to login)
