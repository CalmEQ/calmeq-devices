#!/bin/bash

# this is the commands to run every time the virtual machine is rebooted.

### Do this on reboot of virtual machine
# 1. startup postgresql
sudo service postgresql start 

# 2. boot firefox
sudo Xvfb :10 -ac &
export DISPLAY=:10
firefox &
