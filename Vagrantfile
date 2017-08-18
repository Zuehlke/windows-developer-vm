Vagrant::configure('2') do |config|

  # configure the basebox
  config.vm.box_url = 'http://10.48.29.5/depot/boxes/win10x64-pro.box'
  config.vm.box = 'win10x64-pro'
#  config.vm.box_version = '1.0.0.0'

  # override the basebox when testing (an approximation) with docker
#  config.vm.provider :docker do |docker, override|
#    override.vm.box = 'tknerr/baseimage-ubuntu-16.04'
#    override.vm.box_version = '1.0.0'
#  end

  # virtualbox customizations
  config.vm.provider :virtualbox do |vbox, override|
    vbox.customize ['modifyvm', :id,
      '--name', 'Windows 10 Developer VM',
      '--memory', '8198',
      '--cpus', '4'
    ]
  end

  # set the hostname
  config.vm.hostname = 'windows-developer-vm--local'

  # and the synced folders
  config.vm.synced_folder '.', '/vagrant', disabled: false

  # don't create a new keypair
#  config.ssh.insert_key = false

  # Install ChefDK and trigger the Chef run from within the VM
  config.vm.provision 'shell', privileged: false, keep_color: true, run: 'always',  inline: 'c:/vagrant/scripts/chef.cmd'

  # Ensure we cache as much as possible
#  if Vagrant.has_plugin?("vagrant-cachier")
#    config.cache.enable :generic, {
#      "chef_file_cache" => { cache_dir: "/root/.chef/local-mode-cache/cache" },
#      "berks_cache" => { cache_dir: "/home/vagrant/.berkshelf" }
#    }
#  end
end
