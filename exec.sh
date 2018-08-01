docker-compose up -d
sleep 1m
echo "Starting to drop database ec..."
docker exec -it  mysql  mysql   -e " DROP DATABASE ec; CREATE DATABASE ec CHARACTER SET utf8 COLLATE utf8_general_ci; " --connect-expired-password -uroot -pqazwsx
docker exec -it  mysql  mysql   -e " create user "root"@"%" identified by "qazwsx"; " --connect-expired-password -uroot -pqazwsx
docker exec -it  mysql  mysql   -e " create user "chain"@"%" identified by "qazwsx";" --connect-expired-password -uroot -pqazwsx
docker exec -it  mysql  mysql   -e " grant all  privileges  on  *.* to   "root"@"%"  with  grant option ; " --connect-expired-password -uroot -pqazwsx
docker exec -it  mysql  mysql   -e " grant all  privileges   on  *.* to   "chain"@"%"  with  grant option ;" --connect-expired-password -uroot -pqazwsx

