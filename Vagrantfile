Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080 # Exempel på portforwarding för att komma åt tjänster på port 80 i den virtuella maskinen från port 8080 på värdmaskinen

  config.vm.provision "shell", inline: <<-SHELL
    # Installera Docker
    sudo apt-get update
    sudo apt-get install -y docker.io

    # Installera Kubernetes
    sudo apt-get install -y apt-transport-https curl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubeadm kubelet kubectl
  SHELL
end
