#!/bin/bash

docker build -t miami/phpunit .
docker build -t miami/phpunit:latest .
docker build -t miami/phpunit:6.2 .
docker push miami/phpunit
docker push miami/phpunit:latest
docker push miami/phpunit:6.2

