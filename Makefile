SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -upgrade && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/daemon init -upgrade && $(TERRAFORM) -chdir=modules/daemon validate
		$(TERRAFORM) -chdir=modules/default init -upgrade && $(TERRAFORM) -chdir=modules/default validate
		$(TERRAFORM) -chdir=modules/fargate init -upgrade && $(TERRAFORM) -chdir=modules/fargate validate

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
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/daemon && \
		$(TERRAFORM) fmt -list=true ./modules/default && \
		$(TERRAFORM) fmt -list=true ./modules/fargate && \
		$(TERRAFORM) fmt -list=true ./examples/nginx && \
		$(TERRAFORM) fmt -list=true ./examples/apachesling && \
		$(TERRAFORM) fmt -list=true ./examples/haproxy

example:
	$(TERRAFORM) -chdir=examples/$(EXAMPLE) init -upgrade && $(TERRAFORM) -chdir=examples/$(EXAMPLE) plan -input=false

release: test
	git tag $(VERSION) && git push --tags
