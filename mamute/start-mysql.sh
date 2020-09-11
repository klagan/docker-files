docker run -d \
--name mysql-mamute \
-v ${PWD}/mamutedb:/var/lib/mysql \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=secretpassword \
-e MYSQL_DATABASE=mamute \
-e MYSQL_USER=mamute \
-e MYSQL_PASSWORD=mamute \
mysql:5.7.4

