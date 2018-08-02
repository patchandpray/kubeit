.PHONY: generate_inventory
generate_inventory:
	-mkdir inventories
	ansible-playbook generate_inventory.yml

.PHONY: ping
ping:
	ansible kubeit -m ping
