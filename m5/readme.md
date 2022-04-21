Vagrant file in directory `vagrant-net-static` consist network virtualisation
1 server with 2 clients.
In first part of task setup static ip's and check of it's ping.

requirements
VirtualBox 6.1
Vagrant 2.2.18 or higher

vagrant up #start vm's
vagrant ssh server #connect to server with ssh by key
vagrant halt #poweroff vm's

```
thinkpad /home/b2q/dev/DevOps_online_Kyiv_2022Q1/m5/vagrant-net # vagrant ssh client1
client1:~$ uname -a
Linux client1 4.14.167-0-virt #1-Alpine SMP Thu Jan 23 10:58:18 UTC 2020 x86_64 Linuclient1:~$ uname -a
Linux client1 4.14.167-0-virt #1-Alpine SMP Thu Jan 23 10:58:18 UTC 2020 x86_64 Linux
client1:~$ ping 10.92.3.1
PING 10.92.3.1 (10.92.3.1): 56 data bytes
64 bytes from 10.92.3.1: seq=0 ttl=42 time=0.426 ms
64 bytes from 10.92.3.1: seq=1 ttl=42 time=0.519 ms
64 bytes from 10.92.3.1: seq=2 ttl=42 time=0.669 ms
^C
--- 10.92.3.1 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.426/0.538/0.669 ms
client1:~$ ping 10.92.3.2
PING 10.92.3.2 (10.92.3.2): 56 data bytes
64 bytes from 10.92.3.2: seq=0 ttl=42 time=0.426 ms
64 bytes from 10.92.3.2: seq=1 ttl=42 time=0.207 ms
^C
--- 10.92.3.2 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.207/0.316/0.426 ms
client1:~$ ifconfig
eth0      Link encap:Ethernet  HWaddr 08:00:27:1B:23:B0
          inet addr:10.0.2.15  Bcast:0.0.0.0  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe1b:23b0/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1345 errors:0 dropped:0 overruns:0 frame:0
          TX packets:930 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:156577 (152.9 KiB)  TX bytes:154483 (150.8 KiB)

eth1      Link encap:Ethernet  HWaddr 08:00:27:47:7B:BB
          inet addr:10.92.3.2  Bcast:0.0.0.0  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe47:7bbb/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:10 errors:0 dropped:0 overruns:0 frame:0
          TX packets:25 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:828 (828.0 B)  TX bytes:2180 (2.1 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:672 (672.0 B)  TX bytes:672 (672.0 B)
```

From server to client 1:

```
server:~$ traceroute 10.92.3.2
traceroute to 10.92.3.2 (10.92.3.2), 30 hops max, 46 byte packets
 1  *  *  10.92.3.2 (10.92.3.2)  1.101 ms
server:~$ 
```
From client2 to client 1:

```
thinkpad /home/b2q/dev/DevOps_online_Kyiv_2022Q1/m5/vagrant-net-static # vagrant ssh client2
client2:~$ ping 172.16.3.1
PING 172.16.3.1 (172.16.3.1): 56 data bytes
64 bytes from 172.16.3.1: seq=0 ttl=42 time=2.375 ms
64 bytes from 172.16.3.1: seq=1 ttl=42 time=0.620 ms
^C
--- 172.16.3.1 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.620/1.497/2.375 ms
client2:~$ traceroute 172.16.3.1
traceroute to 172.16.3.1 (172.16.3.1), 30 hops max, 46 byte packets
 1  172.16.3.1 (172.16.3.1)  0.096 ms  0.070 ms  0.060 ms
client2:~$
```

By manually it's can realise by modifying /etc/network/interfaces
```
iface eth0 inet static
        address 172.16.3.1
        netmask 255.255.255.0
```	

DHCP

