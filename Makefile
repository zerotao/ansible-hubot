.PHONY: all

all: test

deps:
		@ansible-galaxy install -r requirements.yml --force

test: clean deps
		vagrant up

clean:
		@echo "Destroying Vagrant virtual machine"
		-@vagrant destroy -f
		@echo "Removing Ansible roles from Vagrant provisioner directory"
		@rm -rf .vagrant/provisioners/ansible/roles/*
