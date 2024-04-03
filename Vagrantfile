Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Ange den synkroniserade mappen
  config.vm.synced_folder ".", "/vagrant", disabled: false

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end


  config.vm.provision "shell", inline: <<-SHELL
    # Installera Python-pip
    sudo apt-get update
    sudo apt-get install -y python3-pip

    # Lägg till standardanvändaren i Docker-gruppen
    sudo usermod -aG docker vagrant


    # Navigera till mappen där Vagrant-filen finns
    cd /vagrant || exit

    chmod -R +x /test

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

    # Installera Kubernetes-kommandot 
    sudo apt-get update && sudo apt-get install -y apt-transport-https curl
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list
    sudo apt update
    sudo apt install kubeadm kubelet kubectl
    sudo kubeadm version

    # Ändra standardkatalogen för användaren vagrant till /vagrant
    echo "cd /vagrant" >> /home/vagrant/.bashrc

  SHELL
end
