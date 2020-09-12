playbook:
	ansible-playbook ansible-playbook.yml

.PHONY: crontab playbook

crontab:
	sudo < src/Cronfile crontab
