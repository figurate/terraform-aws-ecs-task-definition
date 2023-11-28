SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init  && $(TERRAFORM) validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/daemon >./modules/daemon/README.md
		$(TERRAFORM_DOCS) markdown ./modules/default >./modules/default/README.md
		$(TERRAFORM_DOCS) markdown ./modules/fargate >./modules/fargate/README.md

format:
	$(TERRAFORM) fmt -list=true -recursive

example:
	$(TERRAFORM) -chdir=examples/$(EXAMPLE) init  && $(TERRAFORM) -chdir=examples/$(EXAMPLE) plan -input=false

release: test
	git tag $(VERSION) && git push --tags
