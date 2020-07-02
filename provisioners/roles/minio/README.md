# Ansible Role: Minio

Install and configure the [Minio](https://minio.io/) S3 compatible object storage server on Debian/Ubuntu.
This role has two separate tasks, mainly for install and the other just to configure the MinIO.

## Requirements

None.

## Development Guide

Prerequisite:

- [Python](https://www.python.org/) 3.8
- [Ansible](https://www.ansible.com/) 2.9.5
- [Molecule](https://molecule.readthedocs.io/en/latest/#) 3.0.2
- [Molecule-Vagrant](https://github.com/ansible-community/molecule-vagrant) latest
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) latest
- [Vagrant](https://www.vagrantup.com/downloads.html) latest

### Setup
- Install all required software on your local machine
- Setup Virtual Env (Recommended)
```shell script
$ python3 -m venv ~/.ansible-venv
$ source ~/.ansible-venv/bin/activate
```

- Install Python Packages
```shell script
$ python -m pip install ansible
$ python -m pip install molecule-vagrant
$ python -m pip install molecule
```

### How to test
- Make sure Virtual Box and Vagrant is installed.
- Execute command inside directory
    ```bash
    $ molecule test
    ```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
minio_server_bin: /usr/local/bin/minio
minio_client_bin: /usr/local/bin/mc
```

Installation path of the Minio server and client binaries.

```yaml
minio_server_release: ""
minio_client_release: ""
```

Release to install for both server and client; lastest if the default.
Can be 'RELEASE.2019-06-27T21-13-50Z' for instance.

```yaml
minio_user: minio
minio_group: minio
```

Name and group of the user running the minio server.
**NB**: This role automatically creates the minio user and/or group if these does not exist in the system.

```yaml
minio_server_envfile: /etc/default/minio
```

Path to the file containing the minio server configuration ENV variables.

```yaml
minio_server_addr: ":9091"
```

The Minio server listen address.

```yaml
minio_server_datadirs:
  - /var/lib/minio
```

Directories of the folder containing the minio server data

```yaml
minio_server_make_datadirs: true
```

Create directories from `minio_server_datadirs`

```yaml
minio_server_cluster_nodes: [ ]
```

Set a list of nodes to create a [distributed cluster](https://docs.minio.io/docs/distributed-minio-quickstart-guide).

In this mode, ansible will create your server datadirs, but use this list for the server startup. Note you will need a number of disks to satisfy Minio's distributed storage requirements.

Example:

```yaml
minio_server_datadirs:
  - '/minio-data'
  - ...
minio_server_cluster_nodes:
  - 'https://server1/minio-data'
  - 'https://server2/minio-data'
  - 'https://server3/minio-data'
  - ...
```

```yaml
minio_server_env_extra: ""
```

Additional environment variables to be set in Minio server environment

```yaml
minio_server_opts: ""
```

Additional CLI options that must be appended to the minio server start command.

```yaml
minio_access_key: ""
minio_secret_key: ""
```

Minio access and secret keys.

```yaml
minio_install_server: true
minio_install_client: true
```

Switches to disable minio server and/or minio client installation.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  become: yes
  tasks:
    - name: Install and Configure MinIO
      include_role: 
        name: minio
        tasks_from: "{{ task_item }}"
      loop:
        - install
        - configure
      loop_control:
        loop_var: task_item
  vars:
    minio_server_datadirs: [ "/minio-test" ]
```

## Acknowledge
This repository is clean fork from https://github.com/atosatto/ansible-minio, heavily modified to match Gopay System needs.
