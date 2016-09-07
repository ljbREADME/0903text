
#强制开启防火墙 端口
#sudo iptables -I INPUT -p tcp -m state --state NEW -m tcp --dport 22122 -j ACCEPT
#sudo iptables -I INPUT -p tcp -m state --state NEW -m tcp --dport 23000 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

#启动本地tracker
sudo /usr/bin/fdfs_trackerd ./conf/tracker.conf restart
#启动本地storage
sudo /usr/bin/fdfs_storaged ./conf/storage.conf restart


sudo redis-server ./conf/redis.conf

