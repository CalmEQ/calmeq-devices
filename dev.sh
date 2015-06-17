#!/bin/bash

## Do once
# get postgres
sudo apt-get install postgres

# start the postgres service
sudo service postgresql start 

# create ubuntu role (so we dont need to sudo to postgres user)
sudo sudo -u postgres psql
create role ubuntu with createdb login inherit in role postgres 
\q

# migrate - this will blow away previous data, but not a big deal at all
rake db:create:all
rake db:setup
rake db:migrate

## Do this on reboot
sudo service postgresql start 

