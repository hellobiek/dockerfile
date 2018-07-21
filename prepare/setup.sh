#!/bin/bash
echo "begin chek mysql status"
mysql -h mysql-container -uroot -p123456 -e "show status like '%slow%';" >/dev/null 2>&1
status=$?
while [ $status = 1 ];do
    mysql -h mysql-container -uroot -p123456 -e "show status like '%slow%';" >/dev/null 2>&1
    status=$?
    echo "mysql status: error"
    sleep 3
done
echo "mysql status: ok"

echo "begin create mysql function"
mysql -h mysql-container -uroot -p123456 -e 'create database if not exists stock;' >/dev/null 2>&1
if [ $? = 1 ];then
    echo "create database stock failed"
else
    echo "create mysql database success"
fi

echo "begin create UDF function in gearmand"
sqls[0]="DROP FUNCTION IF EXISTS gman_do_background;"
sqls[1]="DROP FUNCTION IF EXISTS gman_servers_set;"
sqls[2]="CREATE FUNCTION gman_do_background RETURNS STRING SONAME 'libgearman_mysql_udf.so';"
sqls[3]="CREATE FUNCTION gman_servers_set RETURNS STRING SONAME 'libgearman_mysql_udf.so';"
sqls[4]="SELECT gman_servers_set('gearmand-container:4730');"
for sql in "${sqls[@]}"
do
    mysql -h mysql-container -uroot -p123456 -e "$sql" >/dev/null 2>&1
done
echo "end create UDF function in gearmand"
#echo "begin gearmand service"
#sqls[0]="create database if not exists gearman;"
#sqls[1]="create table if not exists gearman.gearman_queue (
#            `unique_key` varchar(64) NOT NULL,\
#            `function_name` varchar(255) NOT NULL,\
#            `priority` int(11) NOT NULL,\
#            `data` LONGBLOB NOT NULL,\
#            `when_to_run` INT, PRIMARY KEY  (`unique_key`));"
#for sql in "${sqls[@]}"
#do
#    mysql -h mysql-container -uroot -p123456 -e "$sql" >/dev/null 2>&1
#done
#echo "end gearmand service"
