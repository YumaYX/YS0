# YS0

Ansible playbooks that turn a fresh Red Hat Enterprise Linux-based machine
into a ready-to-use development workstation. Tested on **AlmaLinux 10**.

They set up:

- Base packages, firewalld, and scheduled updates
- A primary user with sudo, SSH keys, and dotfiles
- A `/work` workspace for projects
- Ruby (managed with rbenv) and common gems
- Samba, KVM/libvirt + Vagrant, editors, and other optional tools

## Requirements

- AlmaLinux 10 or another RHEL-based distribution
- Root privileges (`sudo`)
- An internet connection

## Quick start

Run the installer as root:

```sh
curl -fsSL https://raw.githubusercontent.com/YumaYX/YS0/main/init.sh | sudo sh
```

Short URL:

```sh
curl -L bit.ly/ys0 | sudo sh
```

`init.sh` installs Git and Make, clones this repository to `/tmp/YS0`, and runs
`make all`.

## Make targets

| Command        | Description                                        |
| -------------- | -------------------------------------------------- |
| `make`         | Show available targets                             |
| `make install` | Install uv and the Python/Ansible dependencies     |
| `make local`   | Configure this machine (`ans_init.yml`)            |
| `make test`    | Run only the Serverspec tests                      |
| `make pxe`     | Build the PXE boot server (`ans_pxe.yml`)          |
| `make all`     | Same as `make local`                               |
| `make vagrant` | Test the whole setup inside a Vagrant VM           |
| `make clean`   | Remove the VM, virtualenv, and Vagrant state       |

## Running a single role

```sh
sh role.sh <role>
```

Example:

```sh
sh role.sh nfs
```

`role.sh` runs `ans_role.yml`, which applies only the selected role. Run
`ls roles` to see every available role.

## Testing

Serverspec tests live in `serverspec/spec/localhost/`. `make local` runs them at
the end of provisioning. To run only the tests:

```sh
make test
```

## Project layout

```
ans_init.yml        Main provisioning playbook
ans_pxe.yml         PXE boot server playbook
ans_serverspec.yml  Test-only playbook
ans_role.yml        Helper playbook used by role.sh
group_vars/all.yml  Shared variables
roles/              Ansible roles
serverspec/         Serverspec tests
init.sh             One-shot installer
role.sh             Run a single role
```

## Samba

The Samba share is available at `/samba/share`.

```
smb://user:user@192.168.11.42
```

```
net use r: \\172.17.64.1\share user /user:user
```

## Execution environment

- AlmaLinux 10
