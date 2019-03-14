ifconfig eth0 down
ifconfig eth0 hw ether 00:0a:35:00:22:01
ifconfig eth1 hw ether 00:0a:35:00:22:02

ifconfig eth0 10.50.0.1/24 netmask 255.0.0.0
ifconfig eth1 10.50.1.1/24 netmask 255.0.0.0

iptables -t nat -A POSTROUTING -s 10.50.0.1 -d 10.60.1.1 -j SNAT --to-source 10.60.0.1
iptables -t nat -A PREROUTING -d 10.60.0.1 -j DNAT --to-destination 10.50.0.1
iptables -t nat -A POSTROUTING -s 10.50.1.1 -d 10.60.0.1 -j SNAT --to-source 10.60.1.1
iptables -t nat -A PREROUTING -d 10.60.1.1 -j DNAT --to-destination 10.50.1.1
ip route add 10.60.1.1 dev eth0
arp -i eth0 -s 10.60.1.1 00:0a:35:00:22:02
ip route add 10.60.0.1 dev eth1
arp -i eth1 -s 10.60.0.1 00:0a:35:00:22:01