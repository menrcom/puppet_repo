# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant plugin install vagrant-libvirt
# vagrant plugin install vagrant-hosts

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
REGION = 'vagrant'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true


  config.vm.provider "libvirt" do |libvirt|
    libvirt.disk_bus       = 'virtio'
    libvirt.nic_model_type = 'virtio'
    libvirt.memory         = 512
  end


  config.vm.provision :hosts do |hosts|
    hosts.autoconfigure = true
  end


  config.vm.provision :shell, inline: "[ -f puppetlabs-release-trusty.deb ] || wget --quiet https://apt.puppetlabs.com/puppetlabs-release-trusty.deb"
  config.vm.provision :shell, inline: "dpkg -i puppetlabs-release-trusty.deb"
  config.vm.provision :shell, inline: "apt-get update && apt-get -y install puppet"
  config.vm.provision :shell, inline: "puppet agent --enable"


  config.vm.define "puppet-master", primary: true do |machine|
    machine.vm.hostname        = "puppetmaster.#{REGION}"
    machine.vm.network :private_network, ip: '192.168.122.190'

    machine.vm.provision :shell, inline: "puppet module install puppetlabs-ntp"
    machine.vm.provision :shell, inline: "puppet module install puppetlabs-apt"

    machine.vm.provision :puppet do |puppet|
      puppet.module_path    = './site'
      puppet.manifests_path = '.'
      puppet.manifest_file  = 'site.pp'
      puppet.options        = ['-e "include roles::puppetmaster"', '--verbose', '--modulepath=./site:/etc/puppet/modules']
    end

    machine.vm.provision :shell, run: :always, inline: 'r10k deploy environment -v -p'

    machine.vm.provision :puppet_server, run: :always do |puppet|
      puppet.puppet_server = "puppetmaster.#{REGION}"
      puppet.options       = ['--waitforcert 5', '--pluginsync', '-t']
    end    
  end



  machines = {
    'db1'      => { ip: 129, mem: 1024 },
    'auth1'    => { ip: 130, mem: 1024 },
    'api1'     => { ip: 131, mem: 1536 },
    'www1'     => { ip: 132, mem: 1024 },
    'api2'     => { ip: 133, mem: 4096 },
    'compute1' => { ip: 134, mem: 1024 },
    'compute2' => { ip: 135, mem: 2048 },
    'compute3' => { ip: 136, mem: 1024 },
    'compute4' => { ip: 137, mem: 2048 },
    'compute5' => { ip: 134, mem: 4096 },
    'compute6' => { ip: 135, mem: 4096 },
  }

  machines.each do |name, cnf|
    config.vm.define "#{name}" do |agent_node|
      if cnf[:mem]
        agent_node.vm.provider "libvirt" do |libvirt|
          libvirt.memory = cnf[:mem]
        end
      end
      agent_node.vm.hostname = "#{name}.#{REGION}"
      agent_node.vm.network :private_network, auto_network: false, ip: "192.168.122.#{cnf[:ip]}"
      agent_node.vm.provision :puppet_server, run: :always do |puppet|
        puppet.puppet_server = "puppetmaster.#{REGION}"
        puppet.options       = ['-t', '--waitforcert 5', '--pluginsync', '--environment=openstack_tmp']
      end
    end
  end
end
