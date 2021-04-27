playbook:
	ansible-playbook ansible-playbook.yml

.PHONY: ping playbook

ping:
	ansible islasgeci --module-name ping --become
