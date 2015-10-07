#!/bin/sh

HOMEDIR="/d"

if [[ -z "$1" ]] ; then
	echo "Invalid parameter"
	return 1
fi

if [ ! -d "/d/$1/" ] ; then
	echo "Invalid project"
	return 2
fi

docker rm -f  my_apache
docker build -t my_apache .
docker run -i -t -d -p 80:80 --name my_apache -v $HOMEDIR/$1/:/var/www/html my_apache 