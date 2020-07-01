# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.define "haproxy1" do |ha|
    ha.vm.box = "ubuntu/bionic64"
    ha.vm.network "private_network", ip: "192.168.5.19"
    ha.vm.hostname = "haproxy1"

    # ha.vm.provision :ansible do |ansible|
    #   ansible.playbook = "playbook-haproxy.yml"
    #   ansible.galaxy_role_file = "requirements.yml"
    #   ansible.become = true
    #   ansible.verbose = true
    #   ansible.extra_vars = {}
    # end
  end

  config.vm.define "haproxy2" do |ha|
    ha.vm.box = "ubuntu/bionic64"
    ha.vm.network "private_network", ip: "192.168.5.18"
    ha.vm.hostname = "haproxy2"

    ha.vm.provision "shell", path: "scripts/haproxy-keepalived-install.sh"
    ha.vm.provision "file", source: "./configs/haproxy.cfg", destination: "/tmp/haproxy.cfg"
    ha.vm.provision "file", source: "./configs/keepalived.conf", destination: "/tmp/keepalived.conf"
    ha.vm.provision "shell", path: "scripts/move-files.sh"

    # ha.vm.provision :ansible do |ansible|
    #   ansible.playbook = "playbook-haproxy.yml"
    #   ansible.galaxy_role_file = "requirements.yml"
    #   ansible.become = true
    #   ansible.verbose = true
    #   ansible.extra_vars = {}
    # end
  end

  config.vm.define "minio1" do |m|
    m.vm.box = "ubuntu/bionic64"
    m.vm.network "private_network", ip: "192.168.5.20"
    m.vm.hostname = "minio1"

    m.vm.provision :ansible do |ansible|
      ansible.playbook = "provisioners/playbook.yml"
      ansible.galaxy_role_file = "provisioners/requirements.yml"
      ansible.become = true
      ansible.verbose = true
      ansible.extra_vars = {
        minio_server_cluster_nodes: [
          "http://192.168.5.20:9091/var/lib/minio1",
          "http://192.168.5.21:9091/var/lib/minio2",
          "http://192.168.5.22:9091/var/lib/minio3",
          "http://192.168.5.23:9091/var/lib/minio4",
        ],
        minio_access_key: "minioadmin",
        minio_secret_key: "minioadmin",
        minio_server_datadirs: [
          "/var/lib/minio1"
        ]
      }
    end
  end

  config.vm.define "minio2" do |m|
    m.vm.box = "ubuntu/bionic64"
    m.vm.network "private_network", ip: "192.168.5.21"
    m.vm.hostname = "minio2"

    m.vm.provision :ansible do |ansible|
      ansible.playbook = "provisioners/playbook.yml"
      ansible.galaxy_role_file = "provisioners/requirements.yml"
      ansible.become = true
      ansible.verbose = true
      ansible.extra_vars = {
        minio_server_cluster_nodes: [
          "http://192.168.5.20:9091/var/lib/minio1",
          "http://192.168.5.21:9091/var/lib/minio2",
          "http://192.168.5.22:9091/var/lib/minio3",
          "http://192.168.5.23:9091/var/lib/minio4",
        ],
        minio_access_key: "minioadmin",
        minio_secret_key: "minioadmin",
        minio_server_datadirs: [
          "/var/lib/minio2"
        ]
      }
    end
  end

  config.vm.define "minio3" do |m|
    m.vm.box = "ubuntu/bionic64"
    m.vm.network "private_network", ip: "192.168.5.22"
    m.vm.hostname = "minio3"

    m.vm.provision :ansible do |ansible|
      ansible.playbook = "provisioners/playbook.yml"
      ansible.galaxy_role_file = "provisioners/requirements.yml"
      ansible.become = true
      ansible.verbose = true
      ansible.extra_vars = {
        minio_server_cluster_nodes: [
          "http://192.168.5.20:9091/var/lib/minio1",
          "http://192.168.5.21:9091/var/lib/minio2",
          "http://192.168.5.22:9091/var/lib/minio3",
          "http://192.168.5.23:9091/var/lib/minio4",
        ],
        minio_access_key: "minioadmin",
        minio_secret_key: "minioadmin",
        minio_server_datadirs: [
          "/var/lib/minio3"
        ]
      }
    end
  end

  config.vm.define "minio4" do |m|
    m.vm.box = "ubuntu/bionic64"
    m.vm.network "private_network", ip: "192.168.5.23"
    m.vm.hostname = "minio4"

    m.vm.provision :ansible do |ansible|
      ansible.playbook = "provisioners/playbook.yml"
      ansible.galaxy_role_file = "provisioners/requirements.yml"
      ansible.become = true
      ansible.verbose = true
      ansible.extra_vars = {
        minio_server_cluster_nodes: [
          "http://192.168.5.20:9091/var/lib/minio1",
          "http://192.168.5.21:9091/var/lib/minio2",
          "http://192.168.5.22:9091/var/lib/minio3",
          "http://192.168.5.23:9091/var/lib/minio4",
        ],
        minio_access_key: "minioadmin",
        minio_secret_key: "minioadmin",
        minio_server_datadirs: [
          "/var/lib/minio4"
        ]
      }
    end
  end
end
