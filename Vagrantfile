Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Provisionering av filer
  config.vm.provision "file", source: "./src", destination: "/home/vagrant/src"

  config.vm.provision "shell", inline: <<-SHELL
    # Installera Python-pip och använd requirements.txt för att installera paket
    sudo apt-get install -y python3-pip
    pip3 install -r /vagrant/requirements.txt

    # Installera Docker
    sudo apt-get update
    sudo apt-get install -y docker.io

    # Installera Kubernetes
    sudo apt-get install -y apt-transport-https curl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubeadm kubelet kubectl

    # Navigera till mappen src
    cd /home/vagrant/src

  SHELL
end
