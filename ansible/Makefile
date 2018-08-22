verbosity = -vv

.PHONY: generate_inventory
generate_inventory:
	-mkdir inventories
	ansible-playbook generate_inventory.yml

.PHONY: ping
ping:
	ansible kubeit -m ping

.PHONY: install
install:
	ansible-playbook install.yml $(verbosity)

.PHONY: ssh
ssh:
	ssh -i ~/.ssh/google_compute_engine tim_tvdkeer_nl@$(shell cat inventories/kubeit_inventory | sed -n 2p)
