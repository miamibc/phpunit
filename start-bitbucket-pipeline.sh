#!/bin/bash

docker run -it \
	--volume=/var/www/lin:/var/www/lin --workdir="/var/www/lin" \
	--memory=4g --memory-swap=4g --entrypoint=/bin/bash \
	miami/phpunit:6.2
