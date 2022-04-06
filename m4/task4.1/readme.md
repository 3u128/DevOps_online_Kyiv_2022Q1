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
```sudo tree -L 2 / | grep c```
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
ls -l <- means long listing format. Just use with -a or any of similar keys for best readeable or complex information.
ls -a <- all files & with dot files.
ls -lah <- the same with human readable.
S <- largest first
s <- alphab. sort
i <- inode
-t <-last edit (sort by newest)
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

+++++++++++++++++++++++++++++++++++++++
8.
sudo mount -l -t ext4
sudo mount -l <- all partition with type of fs
