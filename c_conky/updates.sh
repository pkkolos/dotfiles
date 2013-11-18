#! /bin/sh

# execute the update of the package list
sudo apt-get update >/dev/null

# make a simulation of the upgrade and take the number of upgrade to do (O if nothing changes)
NB=$(sudo apt-get -s upgrade | grep upgraded, | awk '{print $1}')

echo "$NB"

exit 0
