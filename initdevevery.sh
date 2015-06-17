#!/bin/bash

# this is the commands to run every time the virtual machine is rebooted.
# run by . ./initdevevery.sh 

### Do this on reboot of virtual machine
# 1. startup postgresql
sudo service postgresql start 

# only needed if running integration tests, which may not fit on the micro machine
# 2. boot firefox
# sudo Xvfb :10 -ac &
# export DISPLAY=:10
# firefox &

# 3. test with rake test, and then run the project
rake test:functionals test:units
