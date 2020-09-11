var=`date +"%FORMAT_STRING"`
now=`date +"%m_%d_%Y"`
now=`date +"%Y-%m-%d"`
filename=${now}-mamute.sql

mysqldump -h 127.0.0.1 --user mamute --password > ${filename}

