docker run -d \
    --name mysql-mamute \
    --rm \
    -e MYSQL_ROOT_PASSWORD=secretpassword \
    -e MYSQL_DATABASE=mamute \
    -e MYSQL_USER=mamute \
    -e MYSQL_PASSWORD=mamute \
    mysql:5.7.4