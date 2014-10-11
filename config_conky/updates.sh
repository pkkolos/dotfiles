#!/bin/sh

# execute the update of the package list
sudo apt-get update >/dev/null

# make a simulation of the upgrade and take the number of upgrade to do (O if nothing changes)
echo "$(apt-get -s upgrade | sed -nr 's/^([0-9]+) upgraded.*$/\1/p')"

exit 0
