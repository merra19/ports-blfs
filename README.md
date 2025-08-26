# ports-blfs
 ports based lfs

# NetworkManger
 To allow regular users to configure network connections, you should add them to the netdev group

 /usr/sbin/usermod -a -G netdev <username>

# Gamemode
 To allow regular users to control CPU governor ,you should add them to the gamemode group
 
 gpasswd -a <username> gamemode