#!/bin/bash

set -e

[ -f puppetlabs-release-trusty.deb ] || wget --quiet https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

dpkg -i puppetlabs-release-trusty.deb

apt-get update && apt-get -y install puppet

puppet agent --enable

puppet module install puppetlabs-ntp

puppet apply --modulepath=./site:/etc/puppet/modules -e "include roles::puppetmaster"
