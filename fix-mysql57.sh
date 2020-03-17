#!/bin/bash
#Maks Skamasle
# Fix db.conf missing passwords in vestacp when run mysql 5.7 / ubuntu 16
# I supose you provide 
user=$1
if [ -e /usr/local/vesta/data/users/${user}/db.conf ]; then
	conf=/usr/local/vesta/data/users/${user}/db.conf 
	get_db_user=$(v-list-databases $user plain | awk '{ print  $2 }')

	for u in $get_db_user
	do
		md5=$(mysql -e "SHOW CREATE USER $u" | grep password |cut -f8 -d \' )
		sed -i "s/DBUSER='$u' MD5=''/DBUSER='$u' MD5='$md5'/" $conf
		echo "Mysql User $u Fixed"
	done
fi
