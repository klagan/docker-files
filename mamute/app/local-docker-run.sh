docker run -d \
    --rm \
    --name mamute \
    --link mysql-mamute:mysql \
    -e MAMUTE_PORT=8080 \
    -p 8080:8080 \
    local/mamute:latest