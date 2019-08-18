#!/bin/sh -x


# wait until MySQL is really available
maxcounter=45

echo "ENV MYSQL_USER ${MYSQL_USER}"
echo "ENV MYSQL_ROOT_PASSWORD ${MYSQL_ROOT_PASSWORD}"

counter=1
while ! mysql -u"$MYSQL_USER" -p"$MYSQL_ROOT_PASSWORD" -h 127.0.0.1 -e "show databases;" > /dev/null 2>&1; do
     sleep 1
     counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
         >&2 echo "We have been waiting for MySQL too long already; failing."
         exit 1
    fi;
done
COMPOSER_HOME=/happs composer install --no-interaction
php artisan migrate --seed 

php artisan serve 

tail -f /dev/null

