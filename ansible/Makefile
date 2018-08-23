verbosity = -vv

.PHONY: generate_inventory
generate_inventory:
	-mkdir inventories
	ansible-playbook generate_inventory.yml

.PHONY: generate_vars
generate_vars:
	ansible-playbook generate_vars.yml

.PHONY: ping
ping:
	ansible kubeit -m ping

.PHONY: install
install:
	ansible-playbook install.yml $(verbosity)

.PHONY: master
master:
	ansible-playbook master.yml $(verbosity)

.PHONY: node
node:
	ansible-playbook node.yml $(verbosity)

.PHONY: ssh_master
ssh_master:
	ssh -i ~/.ssh/google_compute_engine tim_tvdkeer_nl@$(shell cat inventories/kubeit_inventory | sed -n 2p)
