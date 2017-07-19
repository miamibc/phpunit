#!/bin/bash

docker build -t miami/phpunit:6.2 . \
	&& docker push miami/phpunit:6.2

