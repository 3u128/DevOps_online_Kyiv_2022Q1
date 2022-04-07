1-2
```
root@epamhw:/home/ubuntu# su
root@epamhw:/home/ubuntu# passwd root
root@epamhw:/home/ubuntu# ls -laht /etc/shadow
-rw-r----- 1 root shadow 1.2K Apr  5 12:53 /etc/shadow
root@epamhw:/home/ubuntu# date
Tue Apr  5 13:04:39 UTC 2022
```
3
root@epamhw:/home/ubuntu# cat .bash_history
By command executions may found some security-sensitive commands like passwords or tables/db's names.
4
root@epamhw:/home/ubuntu# usermod -c "some add-onla info like comment" usernameroot@epamhw:/home/ubuntu# usermod -l new current
or use command chfn
```
root@epamhw:/home/ubuntu# chfn ubuntu
Changing the user information for ubuntu
Enter the new value, or press ENTER for the default
	Full Name [Ubuntu]:
	Room Number []:
	Work Phone []: 000
	Home Phone []: 111
	Other []: 
```
5
man usermod
then find info about comment by : "/comment"
```
       -c, --comment COMMENT
           The new value of the user's password file comment field. It is
           normally modified using the chfn(1) utility.
```

or use info
```
13.3 ‘chmod’: Change access permissions
=======================================

‘chmod’ changes the access permissions of the named files.  Synopsis:

     chmod [OPTION]... {MODE | --reference=REF_FILE} FILE...

   ‘chmod’ never changes the permissions of symbolic links, since the
‘chmod’ system call cannot change their permissions.  This is not a
problem since the permissions of symbolic links are never used.

etc
```
5
less and more command use for paging files. less is more powerfull because readpart of file and have more functionals.
6
```
ubuntu@epamhw:~$ finger -s ubuntu
Login     Name       Tty      Idle  Login Time   Office     Office Phone
ubuntu    Ubuntu     pts/0          Apr  6 08:53 (77.120.39.226)
```
7
```
root@epamhw:/home/ubuntu# ls -lahp
total 44K
drwxr-xr-x 5 ubuntu ubuntu 4.0K Apr  5 12:22 ./
drwxr-xr-x 4 root   root   4.0K Apr  4 08:13 ../
-rw------- 1 ubuntu ubuntu 1014 Apr  5 20:02 .bash_history
-rw-r--r-- 1 ubuntu ubuntu  220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 ubuntu ubuntu 3.7K Feb 25  2020 .bashrc
drwx------ 2 ubuntu ubuntu 4.0K Apr  4 08:14 .cache/
drwx------ 4 ubuntu ubuntu 4.0K Apr  5 12:22 .config/
-rw-r--r-- 1 ubuntu ubuntu  807 Feb 25  2020 .profile
drwx------ 2 ubuntu ubuntu 4.0K Apr  4 08:13 .ssh/
-rw-r--r-- 1 ubuntu ubuntu    0 Apr  4 08:30 .sudo_as_admin_successful
-rw------- 1 ubuntu ubuntu 7.2K Apr  4 08:36 .viminfo
```
Task1 Part2
1
```
sudo tree -L 2 / | grep c
```
2 
file

```
ubuntu@epamhw:~$ file /usr/bin/ln
/usr/bin/ln: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=419f9689c55d7b7752afeb771118751a335346a2, for GNU/Linux 3.2.0, stripped
```
```
ubuntu@epamhw:~$ file .bash_history
.bash_history: UTF-8 Unicode text
```

3

just call 'cd'
or 'cd ~'
/home/user/file <- absolute file
~/file <- relative file

4
```
ubuntu@epamhw:~$ ls -a
.   .bash_history  .bashrc  .config   .profile  .sudo_as_admin_successful
..  .bash_logout   .cache   .lesshst  .ssh      .viminfo
ubuntu@epamhw:~$ ls -l
total 0
```
```
ls -l <- means long listing format. Just use with -a or any of similar keys for best readeable or complex information.
ls -a <- all files & with dot files.
ls -lah <- the same with human readable.
S <- largest first
s <- alphab. sort
i <- inode
-t <-last edit (sort by newest)
```
5
```
ubuntu@epamhw:~$ mkdir subdir
ubuntu@epamhw:~$ ls -ld /* > ./subdir/dir_in_the_root
ubuntu@epamhw:~$ cat ./subdir/dir_in_the_root
/bin
/boot
...

ubuntu@epamhw:~$ cp ./subdir/dir_in_the_root ~/.
ubuntu@epamhw:~$ cp ./subdir/dir_in_the_root /home/ubuntu/
ubuntu@epamhw:~$ ls
dir_in_the_root  subdir
ubuntu@epamhw:~$ rm -ir subdir/
rm: descend into directory 'subdir/'? y
rm: remove regular file 'subdir/dir_in_the_root'? y
rm: remove directory 'subdir/'? y
ubuntu@epamhw:~$ rm dir_in_the_root 
```
6

```
ubuntu@epamhw:~$ mkdir test
ubuntu@epamhw:~$ cp .bash_history ./test/labwork2
ubuntu@epamhw:~/test$ ln labwork2 hard_lab
ubuntu@epamhw:~/test$ ln -s labwork2 sym_lab
```
time in sym link does not change because it's just link, file with info about destination of file

```
ubuntu@epamhw:~/test$ ls -lah
total 16K
drwxrwxr-x 2 ubuntu ubuntu 4.0K Apr  6 20:42 .
drwxr-xr-x 6 ubuntu ubuntu 4.0K Apr  6 20:42 ..
-rw-rw-r-- 2 ubuntu ubuntu    4 Apr  6 20:42 hard_lab
-rw-rw-r-- 2 ubuntu ubuntu    4 Apr  6 20:42 labwork2
lrwxrwxrwx 1 ubuntu ubuntu    8 Apr  6 20:24 sym_lab -> labwork2
```

soft link doesn't open old file and hard link is a "copy" of old file
thats why hard still opens and file had similar content in hard_lnk_labwork2 file

7

```
ubuntu@epamhw:~/test$ locate squid
/usr/lib/python3/dist-packages/sos/report/plugins/squid.py
/usr/lib/python3/dist-packages/sos/report/plugins/__pycache__/squid.cpython-38.pyc
/usr/share/vim/vim81/syntax/squid.vim
ubuntu@epamhw:~/test$ locate traceroute
/etc/alternatives/traceroute6
/etc/alternatives/traceroute6.8.gz
/usr/bin/traceroute6
/usr/bin/traceroute6.iputils
/usr/share/man/man8/traceroute6.8.gz
/usr/share/man/man8/traceroute6.iputils.8.gz
/usr/src/linux-oracle-5.13-headers-5.13.0-1018/tools/testing/selftests/net/traceroute.sh
/usr/src/linux-oracle-5.13-headers-5.13.0-1021/tools/testing/selftests/net/traceroute.sh
/var/lib/dpkg/alternatives/traceroute6
```

8
```
sudo mount -l |  awk '{print $3,$5;}'
```
or more simplier without awk

```
sudo mount -l -t ext4
sudo mount -l <- all partition with type of fs
```
or df command

9

```
sudo mount -l |  awk '{print $3,$5;}' > sequence
ubuntu@epamhw:~$ wc sequence 
  49   98 1238 sequence
```

10

```
ubuntu@epamhw:/etc$  find host*
host.conf
hostname
hosts
hosts.allow
hosts.deny
```

11

```
ubuntu@epamhw:/etc$ ls | grep ss
gss
insserv.conf.d
issue
issue.net
nsswitch.conf
passwd
passwd-
ssh
ssl
```

12

```
ubuntu@epamhw:~$ ls /etc  | less
```

13

all devices in /dev/*
check devices by ls* command
lsblk
lscpu 
etc

example
```
ubuntu@epamhw:/dev$ lsusb
Bus 001 Device 002: ID 0627:0001 Adomax Technology Co., Ltd QEMU USB Tablet
Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
```

14

```
ubuntu@epamhw:~$ file sequence 
sequence: ASCII text
```

p.s. alternative way:
ls -F appends symbols to filenames. These symbols show useful information about files.

    @ means symbolic link (or that the file has extended attributes).
    * means executable.
    = means socket.
    | means named pipe.
    > means door.
    / means directory.
source: https://askubuntu.com/questions/811210/how-can-i-make-ls-only-display-files

15

```
ubuntu@epamhw:~$ ls -ult /etc/ | head -n 6
total 844
lrwxrwxrwx 1 root        root           21 Apr  7 14:19 os-release -> ../usr/lib/os-release
lrwxrwxrwx 1 root        root           23 Apr  7 14:19 vtrgb -> /etc/alternatives/vtrgb
-rw-r--r-- 1 root        root         5215 Apr  7 14:18 manpath.config
-rw-r--r-- 1 root        root         1748 Apr  7 14:17 inputrc
drwxr-xr-x 2 root        root         4096 Apr  7 14:17 bash_completion.d
```

