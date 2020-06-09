#!/bin/bash

read -p "Want to build miami/phpunit:7.5 ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker build -t "miami/phpunit:7.5" .
fi

read -p "Want to publish miami/phpunit:7.5 ? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	docker push "miami/phpunit:7.5"
fi

