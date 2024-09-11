Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.synced_folder "./resources/general", "/home/vagrant/general"

  config.vm.define "zipkin" do |zipkin|
    zipkin.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    zipkin.vm.network "private_network", ip: "192.168.56.10"

    # Reenvío de puertos
    zipkin.vm.network "forwarded_port", guest: 9411, host: 9411

    # Sincroniza la carpeta específica para esta máquina
    zipkin.vm.synced_folder "./resources/zipkin", "/home/vagrant/resources/"

    # Provisión combinada
    zipkin.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "redis" do |redis|
    redis.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    redis.vm.network "private_network", ip: "192.168.56.11"

    redis.vm.network "forwarded_port", guest: 6379, host: 6379

    # Sincroniza la carpeta específica para esta máquina
    redis.vm.synced_folder "./resources/redis", "/home/vagrant/resources/"

    # Provisión combinada
    redis.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "auth-api" do |auth_api|
    auth_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    auth_api.vm.network "private_network", ip: "192.168.56.12"

    # Sincroniza la carpeta específica para esta máquina
    auth_api.vm.synced_folder "./resources/auth-api", "/home/vagrant/resources/"

    auth_api.vm.network "forwarded_port", guest: 8000, host: 8000

    # Provisión combinada
    auth_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "user-api" do |user_api|
    user_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    user_api.vm.network "private_network", ip: "192.168.56.13"

    user_api.vm.network "forwarded_port", guest: 8083, host: 8083

    # Sincroniza la carpeta específica para esta máquina
    user_api.vm.synced_folder "./resources/user-api", "/home/vagrant/resources/"

    # Provisión combinada
    user_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "log-message-processor" do |log_message_processor|
    log_message_processor.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    log_message_processor.vm.network "private_network", ip: "192.168.56.14"

    log_message_processor.vm.network "forwarded_port", guest: 8081, host: 8081

    # Sincroniza la carpeta específica para esta máquina
    log_message_processor.vm.synced_folder "./resources/log-message-processor", "/home/vagrant/resources/"

    # Provisión combinada
    log_message_processor.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "todos-api" do |todos_api|
    todos_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    todos_api.vm.network "private_network", ip: "192.168.56.15"

    todos_api.vm.network "forwarded_port", guest: 8082, host: 8082


    # Sincroniza la carpeta específica para esta máquina
    todos_api.vm.synced_folder "./resources/todos-api", "/home/vagrant/resources/"

    # Provisión combinada
    todos_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    prometheus.vm.network "private_network", ip: "192.168.56.17"

    prometheus.vm.network "forwarded_port", guest: 9090, host: 9090

    # Sincroniza la carpeta específica para esta máquina
    prometheus.vm.synced_folder "./resources/prometheus", "/home/vagrant/resources/"

    # Provisión combinada
    prometheus.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "grafana" do |grafana|
    grafana.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    grafana.vm.network "private_network", ip: "192.168.56.18"

    grafana.vm.network "forwarded_port", guest: 3000, host: 3000

    # Sincroniza la carpeta específica para esta máquina
    grafana.vm.synced_folder "./resources/grafana", "/home/vagrant/resources/"

    # Provisión combinada
    grafana.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end

  config.vm.define "frontend" do |frontend|
    frontend.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    frontend.vm.network "private_network", ip: "192.168.56.16"

    frontend.vm.network "forwarded_port", guest: 8080, host: 8080

    # Sincroniza la carpeta específica para esta máquina
    frontend.vm.synced_folder "./resources/frontend", "/home/vagrant/resources/"

    # Ajuste del Tiempo de Espera
    frontend.vm.boot_timeout = 300

    # Provisión combinada
    frontend.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env
      chmod +x /home/vagrant/general/setup.sh

      chmod +x /home/vagrant/general/run.sh

      /home/vagrant/general/setup.sh
      /home/vagrant/general/run.sh
    SHELL
  end
end



