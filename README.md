# Deploy OpenStack with Vagrant & Puppet

## Deploy puppet master

vagrant up --provider=libvirt puppet-master

## Deploy DB

vagrant up --provider=libvirt db1

## Deploy keystone

vagrant up --provider=libvirt auth1

## Deploy rest of service

vagrant up --provider=libvirt

## Use

- puppet-master: puppet master
- db1: mysql, memcached, rabbitmq, nova-conductor
- auth1: keystone
- api1: nova-api, nova-scheduler, glance-api, glance-registry
- www1: horizon (access with http://horizon/)
- compute1: nova-compute, nova-network, lxc
- compute2: nova-compute, nova-network, kvm

Put:
    192.168.122.132	www1.vagrant www1 horizon

into yout /etc/hosts

And navigate http://horizon/ in yout web browser.


# LXC in OpenStack

## Image preparing for LXC

    apt-get install debootstrap python-glanceclient
    mkfs -t ext4 jessie.img 1g
    mount -oloop,rw jessie.img /mnt
    debootstrap --include=openssh-server,openssh-client,dhcpcd5 jessie /mnt

Edit /mnt/etc/network/interfaces.d/lo:

    auto lo
    iface lo inet loopback

Edit /mnt/etc/network/interfaces.d/eth0:

    auto eth0
    iface eth0 inet dhcp

Remove ssh-hostkeys:

    rm /mnt/etc/ssh/ssh_host_*

Add in /mnt/etc/rc.local

    dpkg-reconfigure openssh-server

Unmount & finish:

    umount /mnt/
    e2fsck -f jessie.img
    resize2fs -M jessie.img
    glance image-create --name lxc-jessie-amd64 --is-public True --disk-format raw --container-format bare --progress --file jessie.img


## Image pinning by hypervisor

    glance image-update <Image ID> --property hypervisor_type=lxc

