1

/etc/passwd -user acc info
username|pass in swadow file|uid|gid|comment|home dir|command/shell

pseudousers:
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin

/etc/group
name|pass|gid|list of users

2

UID

0 -root id
1-99 -daemons, pseudo users, reserved and system users
1000-65535 -regular users
uid -unique id of user
define: useradd -u key

3

GID

groupadd -g key

4

see in /etc/group

```
ubuntu@epamhw:~$ cat /etc/group | grep ubuntu
adm:x:4:syslog,ubuntu
dialout:x:20:ubuntu
```

5

```
ubuntu@epamhw:~$ sudo useradd testuser
ubuntu@epamhw:~$ cat /etc/passwd | grep testuser
testuser:x:1002:1002::/home/testuser:/bin/sh
```

6

usermod -l newlogin

7

set of samples of home dir
more in /etc/default/useradd 

```
ubuntu@epamhw:~$ ls -lah /etc/skel/
total 20K
drwxr-xr-x  2 root root 4.0K Mar  3 19:11 .
drwxr-xr-x 99 root root 4.0K Apr  7 15:38 ..
-rw-r--r--  1 root root  220 Feb 25  2020 .bash_logout
-rw-r--r--  1 root root 3.7K Feb 25  2020 .bashrc
-rw-r--r--  1 root root  807 Feb 25  2020 .profile
```

8

userdel -r -f USER
r - remove 
f - forse

in config set dir for mail
/etc/login.defs
MAIL_DIR        /var/mail

or in another file
/etc/deluser.conf

9

set lock/un
usermod -L
usermod -U

10

passwd -e
immediately expire - force user to change pwd

11

```
ubuntu@epamhw:~$ ls -dl test
drwxrwxr-x 2 ubuntu ubuntu 4096 Apr  7 20:34 test
```

d - dir
perm-on and attr
username\group
size
date modif.
name of dir

12

rwx rwx rwx bit 
usr grp other

r - read
w - write
x - extract

13

between file and user is ownership 

14

chown - change owner

```
ubuntu@epamhw:~$ ls -l
total 4
drwxrwxr-x 2 ubuntu ubuntu 4096 Apr  7 20:34 test
-rw-rw-r-- 1 ubuntu ubuntu    0 Apr  7 21:07 testfile
ubuntu@epamhw:~$ sudo chown root:ubuntu testfile
ubuntu@epamhw:~$ ls -l
total 4
drwxrwxr-x 2 ubuntu ubuntu 4096 Apr  7 20:34 test
-rw-rw-r-- 1 root   ubuntu    0 Apr  7 21:07 testfile
```

15

umask changes the default permissions and thus the permissions for all newly created files and folders

attributes by codes:
0 : read, write and execute
1 : read and write
2 : read and execute
3 : read only
4 : write and execute
5 : write only
6 : execute only
7 : no permissions

source: https://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html

digit transformation can describe how to set attr.
rwx
000 0
001 1
010 2
011 3
100 4
101 5
110 6
111 7

in the end :
set UID|set GID|BIT|R|W|X|R|W|X|R|W|X|
   0   |   0   | 0 |1|1|1|1|0|1|0|0|0|
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
           0       |  7  |  5  |  0  |
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
umask 0750

16

sticky bit is a flag
```
chmod +t you_cannot_delete_this_file_even_you_have_write_permission #for only owner 

ubuntu@epamhw:~$ ls -la you_cannot_delete_this_file_even_you_have_write_permission
-rw-rw-r-T 1 ubuntu ubuntu 0 Apr  7 21:33 you_cannot_delete_this_file_even_you_have_write_permission
```

where big T is a flag

17

```
ubuntu@epamhw:~$ touch execute_file.py
ubuntu@epamhw:~$ chmod +x execute_file.py
ubuntu@epamhw:~$ ls -la execute_file.py
-rwxrwxr-x 1 ubuntu ubuntu 0 Apr  7 21:35 execute_file.py
```

x - means execute
