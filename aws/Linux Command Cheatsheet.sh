# ========================
# LINUX COMMAND CHEATSHEET
# ========================

# ===============
# SYSTEM COMMANDS
# ===============

sudo -i         --> Login as root user 
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











