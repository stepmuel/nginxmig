Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "55.55.55.5"
  config.vm.provision :shell, path: "provision.sh"
end
