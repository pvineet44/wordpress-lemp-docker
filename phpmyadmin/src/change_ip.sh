ip=`ip address | grep "0.3/" | awk '{print $2}'`
cut_ip=${ip%.*}
mysql_host=".2"
new_ip=$cut_ip$mysql_host
echo $new_ip         
sed -i 's/NEW_IP/'${new_ip}'/g' /home/root/www/phpmyadmin/config.inc.php
