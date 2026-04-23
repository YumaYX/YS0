# YS0

Ansible Recipe for Red Hat Enterprise Linux-based Distributions: Setting up a Work Environment with the Installation of Ruby, various servers, and additional tools.

# Usage

run the following command as root on Red Hat Enterprise Linux-based Distribution

```sh
curl -fsSL https://raw.githubusercontent.com/YumaYX/YS0/main/init.sh | sudo sh
```

```sh
curl -L bit.ly/ys0 | sh
```

## How to Excecute a role

```sh
sh role.sh <role>
```

# Vagrantfile

Vagrantfile for Testing the YS0

# How to connect to a Samba Server

```
smb://user:user@192.168.11.42
```

```
net use r: \\172.17.64.1\share user /user:user
```

# Execution environment 

- AlmaLinux 10

