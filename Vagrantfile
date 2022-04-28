Vagrant.configure("2") do |config|

  config.vm.define "docker" do |centos1|
    centos1.vm.box = "shakirshakiel/centos_docker"
    centos1.vm.box_version = "19.03.1"
    centos1.vm.network "private_network", ip: "192.168.199.151"
    centos1.vm.synced_folder ".", "/home/vagrant/elasticsearch-index-manager"
  end

end

