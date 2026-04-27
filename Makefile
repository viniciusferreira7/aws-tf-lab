DIR = day-$(DAY)-$(NAME)

new:
	cp -r _shared/ $(DIR)
	touch $(DIR)/main.tf $(DIR)/variables.tf $(DIR)/outputs.tf
	@echo "✓ $(DIR)/ created — new time to implement"

init:
	terraform -chdir=$(DIR) init

plan:
	terraform -chdir=$(DIR) plan

apply:
	terraform -chdir=$(DIR) apply

destroy:
	terraform -chdir=$(DIR) destroy

fmt:
	terraform fmt -recursive .

validate:
	terraform -chdir=$(DIR) validate

.PHONY: new init plan apply destroy fmt validate
