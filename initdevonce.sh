#!/bin/bash

## These are the commands to run with a new environment from cloud9

# 1. get the stuff
bundle install

# 2. get postgres
sudo apt-get install postgresql 

# 3 .start the postgres service
sudo service postgresql start 

# 4. create ubuntu role (so we dont need to sudo to postgres user)
sudo sudo -u postgres psql -c 'create role ubuntu with createdb login inherit in role postgres;'

# 5. migrate to new db - this will blow away previous data, but not a big deal at all
rake db:create:all
rake db:setup
rake db:migrate

# 6. startup firefox for selenium testing
sudo Xvfb :10 -ac &
export DISPLAY=:10
firefox &

# test with rake test, and then run the project
rake test:functionals test:units


