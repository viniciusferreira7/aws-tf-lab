DIR = day-$(DAY)-$(NAME)

new:
	cp -r _shared/ $(DIR)
	@echo 'terraform {\n  backend "s3" {\n    bucket         = "aws-tf-lab-state"\n    key            = "$(DIR)/terraform.tfstate"\n    region         = "us-east-1"\n    dynamodb_table = "aws-tf-lab-lock"\n    encrypt        = true\n  }\n}' > $(DIR)/backend.tf
	touch $(DIR)/main.tf $(DIR)/variables.tf $(DIR)/outputs.tf
	@echo "✓ $(DIR)/ criado — bora implementar"

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
