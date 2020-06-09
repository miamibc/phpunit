#!/bin/bash

docker run -it \
	--volume=/var/www/intranet:/var/www/intranet --workdir="/var/www/intranet" \
	--memory=4g --memory-swap=4g --entrypoint=/bin/bash \
	miami/phpunit:7.5
