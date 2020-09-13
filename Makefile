playbook:
	ansible-playbook ansible-playbook.yml

.PHONY: crontab ping playbook

crontab:
	sudo < src/Cronfile crontab

ping:
	ansible islasgeci --module-name ping --become
