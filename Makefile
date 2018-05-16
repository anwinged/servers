configure:
	ansible-playbook \
		--inventory "ansible/hosts_prod" \
		--extra-vars='ansible_python_interpreter=/usr/bin/python3' \
		--become \
		--become-user=av \
		--ask-become-pass \
		ansible/configuration.yml

dry-run:
	ansible-playbook \
		--inventory "ansible/hosts_prod" \
		--extra-vars='ansible_python_interpreter=/usr/bin/python3' \
		--become \
		--become-user=av \
		--ask-become-pass \
		--check \
		--diff \
		ansible/configuration.yml

install-roles:
	ansible-galaxy install -r "ansible/requirements.yml"

test-rebuild:
	vagrant destroy -f && vagrant up

lint:
	ansible-lint "./ansible/configuration.yml" --exclude="./ansible/galaxy.roles/" -v || true
	ansible-lint "./ansible/roles/ssl-certificate/tasks/main.yml" -v || true
