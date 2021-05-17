ip=`ip address | grep "172.*.0.*/" | awk '{print $2}'`
cut_ip=${ip%.*}
wp_host=".2"
new_ip=$cut_ip$wp_host
echo $new_ip         
sed -i 's/NEW_IP/'${new_ip}'/g' /home/root/www/wp-config.php
