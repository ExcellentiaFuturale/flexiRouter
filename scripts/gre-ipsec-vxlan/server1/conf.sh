vppctl exec `pwd`/ipsec.txt

vppctl exec `pwd`/gre.txt

ifconfig vpp2 10.100.0.7 netmask 255.255.255.254
ip route add 10.10.10.0/24 via 10.100.0.6

vppctl exec `pwd`/vxlan.txt

ifconfig vpp3 10.101.0.7 netmask 255.255.255.254
