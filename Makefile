export UV_PYTHON_INSTALL_DIR := /tmp/uv/python

UV := $(HOME)/.local/bin/uv
ENV_VARS := sudo -E LANG=C
ANSIBLE_CMD := ansible-playbook -i localhost, -c local

.DEFAULT_GOAL := help
.PHONY: help all install local test pxe vagrant clean

help:
	@echo "YS0 - development machine provisioning"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "  install   Install uv and the Ansible dependencies"
	@echo "  local     Configure this machine (ans_init.yml)"
	@echo "  test      Run the Serverspec tests (ans_serverspec.yml)"
	@echo "  pxe       Build the PXE boot server (ans_pxe.yml)"
	@echo "  all       Same as 'make local'"
	@echo "  vagrant   Test the whole setup inside a Vagrant VM"
	@echo "  clean     Remove the VM, virtualenv, and Vagrant state"

all: local

install:
	@command -v $(UV) >/dev/null 2>&1 || curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "uv is installed: $$($(UV) --version)"
	$(UV) sync

# Main targets

local: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_init.yml

test: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_serverspec.yml

pxe: install
	$(ENV_VARS) $(UV) run $(ANSIBLE_CMD) ans_pxe.yml

# Development

vagrant: clean
	-vagrant destroy -f
	-vagrant up --provision
	vagrant destroy -f --no-tty

clean:
	@sudo -v
	-vagrant destroy -f
	sudo rm -rf .venv .vagrant
