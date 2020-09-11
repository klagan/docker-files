docker run -d \
--name mamute \
--link mysql-mamute:mysql \
-e MAMUTE_PORT=8080 \
-p 8080:8080 \
kaml/mamute:1.5.0

