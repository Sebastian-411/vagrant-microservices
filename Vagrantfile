Vagrant.configure("2") do |config|
  # Define the base box for all virtual machines
  config.vm.box = "ubuntu/bionic64"

  # Define the base synced folder, available to all VMs
  config.vm.synced_folder "./resources/general", "/home/vagrant/general"

  # Define VM for Zipkin service
  config.vm.define "zipkin" do |zipkin|
    zipkin.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    zipkin.vm.network "private_network", ip: "192.168.56.10" # Private network IP for Zipkin

    # Forward port 9411 to access Zipkin UI
    zipkin.vm.network "forwarded_port", guest: 9411, host: 9411

    # Sync specific folder for Zipkin
    zipkin.vm.synced_folder "./resources/zipkin", "/home/vagrant/resources/"

    # Provisioning script for Zipkin
    zipkin.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Redis service
  config.vm.define "redis" do |redis|
    redis.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    redis.vm.network "private_network", ip: "192.168.56.11" # Private network IP for Redis

    # Forward port 6379 to access Redis
    redis.vm.network "forwarded_port", guest: 6379, host: 6379

    # Sync specific folder for Redis
    redis.vm.synced_folder "./resources/redis", "/home/vagrant/resources/"

    # Provisioning script for Redis
    redis.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Auth API service
  config.vm.define "auth-api" do |auth_api|
    auth_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    auth_api.vm.network "private_network", ip: "192.168.56.12" # Private network IP for Auth API

    # Sync specific folder for Auth API
    auth_api.vm.synced_folder "./resources/auth-api", "/home/vagrant/resources/"

    # Forward port 8000 to access Auth API
    auth_api.vm.network "forwarded_port", guest: 8000, host: 8000

    # Provisioning script for Auth API
    auth_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for User API service
  config.vm.define "user-api" do |user_api|
    user_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    user_api.vm.network "private_network", ip: "192.168.56.13" # Private network IP for User API

    # Forward port 8083 to access User API
    user_api.vm.network "forwarded_port", guest: 8083, host: 8083

    # Sync specific folder for User API
    user_api.vm.synced_folder "./resources/user-api", "/home/vagrant/resources/"

    # Provisioning script for User API
    user_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Log Message Processor service
  config.vm.define "log-message-processor" do |log_message_processor|
    log_message_processor.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    log_message_processor.vm.network "private_network", ip: "192.168.56.14" # Private network IP for Log Message Processor

    # Forward port 8081 to access Log Message Processor
    log_message_processor.vm.network "forwarded_port", guest: 8081, host: 8081

    # Sync specific folder for Log Message Processor
    log_message_processor.vm.synced_folder "./resources/log-message-processor", "/home/vagrant/resources/"

    # Provisioning script for Log Message Processor
    log_message_processor.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Todos API service
  config.vm.define "todos-api" do |todos_api|
    todos_api.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    todos_api.vm.network "private_network", ip: "192.168.56.15" # Private network IP for Todos API

    # Forward port 8082 to access Todos API
    todos_api.vm.network "forwarded_port", guest: 8082, host: 8082

    # Sync specific folder for Todos API
    todos_api.vm.synced_folder "./resources/todos-api", "/home/vagrant/resources/"

    # Provisioning script for Todos API
    todos_api.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Prometheus service
  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    prometheus.vm.network "private_network", ip: "192.168.56.17" # Private network IP for Prometheus

    # Forward port 9090 to access Prometheus
    prometheus.vm.network "forwarded_port", guest: 9090, host: 9090

    # Sync specific folder for Prometheus
    prometheus.vm.synced_folder "./resources/prometheus", "/home/vagrant/resources/"

    # Provisioning script for Prometheus
    prometheus.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Grafana service
  config.vm.define "grafana" do |grafana|
    grafana.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    grafana.vm.network "private_network", ip: "192.168.56.18" # Private network IP for Grafana

    # Forward port 3000 to access Grafana
    grafana.vm.network "forwarded_port", guest: 3000, host: 3000

    # Sync specific folder for Grafana
    grafana.vm.synced_folder "./resources/grafana", "/home/vagrant/resources/"

    # Provisioning script for Grafana
    grafana.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end

  # Define VM for Frontend service
  config.vm.define "frontend" do |frontend|
    frontend.vm.provider "virtualbox" do |vb|
      vb.memory = "1024" # Allocate 1024MB of RAM
    end

    frontend.vm.network "private_network", ip: "192.168.56.16" # Private network IP for Frontend

    # Forward port 8080 to access Frontend
    frontend.vm.network "forwarded_port", guest: 8080, host: 8080

    # Sync specific folder for Frontend
    frontend.vm.synced_folder "./resources/frontend", "/home/vagrant/resources/"

    # Set the boot timeout for the Frontend VM
    frontend.vm.boot_timeout = 300

    # Provisioning script for Frontend
    frontend.vm.provision "shell", inline: <<-SHELL
      source /home/vagrant/resources/.env # Load environment variables
      chmod +x /home/vagrant/general/setup.sh # Make setup script executable
      chmod +x /home/vagrant/general/run.sh # Make run script executable

      /home/vagrant/general/setup.sh # Execute setup script
      /home/vagrant/general/run.sh # Execute run script
    SHELL
  end
end
