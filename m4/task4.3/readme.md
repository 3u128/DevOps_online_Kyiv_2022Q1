task 3
1

5 state
```
    'D' = UNINTERRUPTABLE_SLEEP
    'R' = RUNNING & RUNNABLE
    'S' = INTERRRUPTABLE_SLEEP
    'T' = STOPPED
    'Z' = ZOMBIE
```

2

pstree - display a tree of processes

```
pstree -h ubuntu
```

3

pseudo fs
Display current state of the kernel.
Contain info about hw and running process.
sys fs - next step of representation hw and proc-ss.

4

```
ubuntu@epamhw:~$ cat /proc/cpuinfo | more

processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD EPYC 7551 32-Core Processor
stepping	: 2
microcode	: 0x1000065
cpu MHz		: 1996.249
cache size	: 512 KB
...
```

5

```
ubuntu@epamhw:~$ ps -exo pid,cmd,%mem,%cpu --sort=-%mem | more
    PID CMD                         %MEM %CPU
  23598 /lib/systemd/systemd --user  0.9  0.0
  23701 sshd: ubuntu@pts/0           0.7  0.0
  23702 -bash LANG=C.UTF-8 USER=ubu  0.5  0.0
  23599 (sd-pam)                     0.3  0.0
  27403 ps -exo pid,cmd,%mem,%cpu -  0.3  0.0
  27404 more SHELL=/bin/bash PWD=/h  0.2  0.0
```

6

```
ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls

ubuntu@epamhw:~$ ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls
USER         PID    PPID CMD                         CLS
root           2       0 [kthreadd]                   TS
root           3       2 [rcu_gp]                     TS
root           4       2 [rcu_par_gp]                 TS
root           6       2 [kworker/0:0H-events_highpr  TS
root           9       2 [mm_percpu_wq]               TS

```

and add --deselect for only user process

```
ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls --deselect

ubuntu@epamhw:~$ ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls --deselect
USER         PID    PPID CMD                         CLS
root           1       0 /sbin/init                   TS
root         410       1 /lib/systemd/systemd-journa  TS
root         439       1 /lib/systemd/systemd-udevd   TS
root         574       1 /sbin/multipathd -d -s       RR
_rpc         663       1 /sbin/rpcbind -f -w          TS
systemd+     664       1 /lib/systemd/systemd-timesy  TS

```
source: [https://unix.stackexchange.com/a/411175](https://unix.stackexchange.com/a/411175)

7

```
ps aux
               D    uninterruptible sleep (usually IO)
               I    Idle kernel thread
               R    running or runnable (on run queue)
               S    interruptible sleep (waiting for an event to
                    complete)
               T    stopped by job control signal
               t    stopped by debugger during the tracing
               W    paging (not valid since the 2.6.xx kernel)
               X    dead (should never be seen)
               Z    defunct ("zombie") process, terminated but not
                    reaped by its parent

       For BSD formats and when the stat keyword is used, additional
       characters may be displayed:

               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and
                    custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL
                    pthreads do)
               +    is in the foreground process group

```
source: [https://man7.org/linux/man-pages/man1/ps.1.html#PROCESS_STATE_CODES](https://man7.org/linux/man-pages/man1/ps.1.html#PROCESS_STATE_CODES)

for example 

```
ubuntu@epamhw:~$ ps aux | grep cron
root         832  0.0  0.3   8544  3016 ?        Ss   Apr07   0:00 /usr/sbin/cron -f
```
where status "Ss" means interruptible sleep (waiting for an event to complete)
and low "s" - is a session leader

8

```
ubuntu@epamhw:~$ ps aux | grep root
root           1  0.0  1.1 167616 11136 ?        Ss   Apr07   0:11 /sbin/init
root           2  0.0  0.0      0     0 ?        S    Apr07   0:00 [kthreadd]
```

9

grep, awk, sed

10

the same ps, but in real time & interactivity and hotkeys by cpu, mem etc.

11

press u -> print by what user filter and press enter

12

l,t,m     Toggle Summary: 'l' load avg; 't' task/cpu stats; 'm' memory info

13

shift + f interactive mode
select fild by _cpu_ _mem_ or else parameters
press s for set
press q for exit

14

```
ubuntu@epamhw:~$ sudo renice -1 23701
23701 (process ID) old priority 0, new priority -1
```
where renice -command for chage NI
renice PID NI options

15

press r and set PID -> enter
next set number of NI (-19 is highest, default 0) -> enter

16

kill -signal -pid

SIGINT 	2 	Signals when the Linux user presses ‘CONTROL-C’
SIGHUP 	1 	Hangs up signals when controlling the terminal or at the end of the controlling processes.
SIGQUIT 	3 	Signals when the Linux user presses ‘CONTROL-D’
SIGFPE 	8 	Signals when any unexpected mathematical operation is performed.
SIGKILL 	9 	When any of the process issues this signal, it will quit immediately.
SIGALRM 	14 	Signals for alarm clock
SIGTERM 	15 	Signals to terminate the process or the software.
SIGSTOP 	17,19,23 	Signals to stop the process in Linux.

source: [https://www.educba.com/linux-kill-signals/](https://www.educba.com/linux-kill-signals/)

17

jobs - list of process running in background

jobs, fg, bg, nohup

Part2

1

2
change port from default
disable pass auth
change ListenAddress

3
ssh-keygen -t rsa
-t dsa 
-t ed25519
```
b2q@thinkpad ~ $ ssh-keygen -t ed25519 -C "ylytviak@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/b2q/.ssh/id_ed25519): new
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in new
Your public key has been saved in new.pub
The key fingerprint is:
SHA256:phXQDoF+IRXdVcZTixxwH2TRIf823gnyCGJIGNXl1qk ylytviak@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|   ..+*=.o oo*+B=|
|    = oo+ o +.X +|
|   o o +.o o o = |
|    o o o..     .|
|     o oSE . . .o|
|      .+. . + o.+|
|      .    . . o.|
|                 |
|                 |
+----[SHA256]-----+
b2q@thinkpad ~ $ cat new.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdj3NbJP3V79477txM1h64GEIDdcN3WqPYotam7cfPH ylytviak@gmail.com
```

