# ========================
# LINUX COMMAND CHEATSHEET
# ========================

# ===============
# SYSTEM 
# ===============

sudo su       --> Login as root user 
exit            --> Exit from current user
whoami          --> Which user logged_in
pwd             --> Current Working Directory
cd              --> Change Directory
          cd ..              -> Go back previous directory
          cd ../..           -> Go back 2 previous directory 
ls              --> List Files / Directory in current path
lshw            --> List hardware configuration information
date            --> View date
timedatectl     --> View time & Date 
hwclock         --> Display Hardware Clock
uname -a        --> Displays system information: kernel version, machine type, and more. ( uname -a , -r , -v , -m )
cal             --> Calander 
whoami          --> Displays the username of the current user
clear           --> Clear the screen
uname -a,-r,    --> Displays the Linux infromation
uptime          --> Shows how long system is running
last reboot     --> List system reboot history
hostname        --> Shows the system hostname
hostname -i     --> Show the IP address of System
shutdown now    --> Shutdown my system / server
finger username --> Displays information about a user
top , htop ,btop--> View the running process
      * kill -9  -> to kill the running processor forcefuly
      * kill -15 -> to kill the running processor properly
ps -ef           --> to view the running processor
      ps -ef | grep ec2-user -> to view the particular processor
cat /proc/cpuinfo --> CPU info
cat /proc/meminfo --> Memory Info
history          --> View history
     HISTTIMEFORMAT="%Y-%m-%d %T " --> View complte history 
     history -c                    --> Delete all command in history
     history -d 32,26.02           --> Delete particular command in history
     history then # !10            --> Run a command again in history list


# =======================
# DIRECTORY/FILES
# =======================

mkdir Dir_1             --> Create a directory
    mkdir Tester{0..5}     => Create 6 dir at time
    rmdir -f Tester{0..5}  => Delete 6 dir at time.
cp -r Dir_1 Dir_2      --> Copy Source _ Distination_Directory 
mv Dir_1 Dir_2         --> Move Source _ Distination_Directory 
diff Dir_1 Dir_2       --> Compare two DIRS and display differences.
--------------------------------------------------------------------------
touch File_1                             --> Create a File without content
    touch Developer{0..5}  => Create 6 dir at time
    rm -f Developer{0..5}  => Delete 6 dir at time
echo " My linux commands " > testing.txt --> Create a file with content
cat > File_2                             --> Create a file with content 
cp File_1 Dir_2         --> Copy Source files _ Distination_Directory 
mv File_2 Dir_2         --> Move Source files _ Distination_Directory
diff File_1 File_2     --> Compare two files and display differences.
--------------------------------------------------------------------------- 
tail -f /var/log/syslog --> Check System logs @ Run_time ( IMPORTANT REAL TIME )
less updates.txt <<< /// >>> more updates.txt => content page by page view
head -10 updates.txt    --> Shows first 10 lines of file 
tail -10 updates.txt    --> Shows last 10 lines of file

# =======================
# VI/VIM EDITOR
# =======================

:wq      --> Save & Quit
:q!      --> quit force without saves
3yy      --> Copy 3 lines <<< /// >>> p => Paste a lines
dd       --> delete single line ,3dd => delete 3 lines, x = backspace
:%d      --> Delete all lines
:set nu / :set nonu       --> Numbers settings
:2       --> Navigate that line
u        --> Undo 
Ctrl+r   --> Redo 
/ = Search, downside >>> "n" upside >>>"shft+n" → next and next 
:%s/uma/umauser1/g or gc => Search & Replace all in text file completely.
g + U + w & g+u+w => change uppercase to lower case
g + U + G & g + u + gg => all line uppercase & Lowercase
cntrl+z <<< /// >>> fg     --> Minimize and Maximize editor ( Must save& Exit before close terminal ) 
gg          --> switch to the first line
shift + g   --> switch to the last line

# =========================
# FILE COMPRESSION/TRANSFER
# =========================

scp file_1 ec2-user@1.1.1.1 /home/ec2-user --> File transfer Server_1 to Server_2
wget <URL>                     --> Download any tool / file from internet
sudo curl -O [link]            --> Transfer data to or from a server to Servers
tar -cvzf [file/directory]     -->  Archive   [file/directory] using TAR_FORMAT
tar -xvzf [file/directory.tar] --> Un-Archive [file/directory] using TAR_FORMAT
gzip [file_name]               --> Archive   [file/directory] using  gzip_FORMAT
gunzip [file_name.gz]          --> Un-Archive [file/directory] using gzip_FORMAT


# =========================
# NETWORKING/SSH
# =========================

nmtui                     --> Change Host_name
ifconfig                  --> Show all IP address ( IP_V4 , IP_v6 )
ping [remote_host]        --> Ping Servers ( communication_check )
netstat -pnltu            --> Check TCP / UDP lister's port's  
host [domain_name]        --> Check Domain_IP
hostname -i               #--> Show local IP's address 
nslookup [domain_name]    --> Receive information about an internet domain

ssh -i ec2-user@1.1.1.1        --> Communication establishment SERVER to SERVERS
ssh -keygen                    --> Creating Key_pairs
ssh -p "1111" ec2-user@1.1.1.1 --> Connect to the host using a particular port
sudo systemctl start sshd      --> Start sshd ( Demon_process )




# =========================
# DISK COMMANDS
# =========================

df -hi            --> Check free and used space on mounted systems
lsblk             --> List Block 
du -ah , -sh      --> See disk usage for all filesand directories.
free -h           --> Display free and usedmemory
fdisk -l          --> Display disk partitions
lshw              --> List Hardware info

# =============
# BOOTSTRAPPING 
# =============

1, Redhat LINUX -->
---------------
#! /bin/bash
sudo yum install httpd -y
systemctl start httpd
sudo yum update

2, Amazon Linux -->
---------------
#! /bin/bash
sudo yum install httpd -y
systemctl start httpd
sudo yum update

3, UBUNTU LINUX -->
---------------
#! /bin/bash
sudo apt-get update
sudo apt install apache2 -y
systemctl start apache2
sudo apt-get update

# ============
# CRYPTOGRAPHY 
# ============

echo "User1" -> Encrypt this variable / Password 
echo -n "User1" | base64 -> En encrypted
echo -n "uty54yt55t5t5t6" | base64 - decode -> Decrypted


# ====================
# FILE/DIR PERMISSIONS 
# ====================

# * R - read    -> 4
# * W - Write   -> 2
# * X - excute  -> 1

ls -larth                      -->  List files / Dirs
chmod 754 file_name            -->  Change permission File_name 
chmod U=rwx,  G=rx-,    O=-r- file_name 
chmod 777 User1  => Set full permission ( File / Directory )
id                     --> See details about theactive users
last                   --> Show the last system logins
who                    -->  Display who is currently logged into the system
sudo useradd User1  -->  Create new user
passwd User1        -->  Create Password 
finger ubuntu          -->  Show user information
su - User1          --> Login as User1 ( USER ) 
sudo userdel User1  -->  Delete user


# =================
# COMMAND SHORTCUTS
# =================

Ctrl + C        -->  Kill running process
Ctrl + Z        -->  Stop the current process
Ctrl + W        -->  Cut one word before the cursor
Ctrl + U        -->  Cut part of the line before the cursor
Ctrl + K        -->  Cut part of the line after the cursor
Ctrl + Y        -->  Paste from clipboard
Ctrl + R        -->  Recall the last command that matches the provided characters.
!!              -->  run again last command 
exit            -->  Log out of the current session











