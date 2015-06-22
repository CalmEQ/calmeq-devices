# Step #1
# working test suite

# Step #2
# Get Gemnasium
sudo sh -c 'echo "deb http://apt.gemnasium.com stable main" > /etc/apt/sources.list.d/gemnasium.list'
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E5CEAB0AC5F1CA2A
sudo apt-get update
sudo apt-get install gemnasium-toolbelt

# Step #3 
# Specify the command and/or script to execute to run the tests into the environment variable GEMNASIUM_TESTSUITE. Ie:
export GEMNASIUM_TESTSUITE="bundle exec rake test:functionals test:units"

# Step #4 
# Specify the project slug into the environment variable GEMNASIUM_PROJECT_SLUG. Ie:
export GEMNASIUM_PROJECT_SLUG="CalmEQ/calmeq-devices"

# Step #5 
# Run the command:
gemnasium autoupdate run
