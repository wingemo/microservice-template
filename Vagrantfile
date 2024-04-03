Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Provisionering av filer
  config.vm.provision "file", source: ".", destination: "/home/vagrant/"

  config.vm.provision "shell", inline: <<-SHELL
    # Installera Python-pip
    sudo apt-get update
    sudo apt-get install -y python3-pip

    # Navigera till mappen där requirements.txt finns
    cd /home/vagrant || exit

    # Installera paket från requirements.txt
    if sudo pip3 install -r requirements.txt; then
      echo "Installation successful"
    else
      echo "Requirements installation failed"
      exit 1
    fi

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
