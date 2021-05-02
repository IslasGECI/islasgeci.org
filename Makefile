playbook:
	ansible-playbook ansible-playbook.yml

.PHONY: ping playbook

ping:
	ansible islasgeci.org --module-name ping --become
