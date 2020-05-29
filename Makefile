SHELL:=/bin/bash
TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -v "${HOME}:/root" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

.PHONY: all clean test example docs format

all: test docs format

clean:
	rm -rf .terraform/

test:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/daemon && $(TERRAFORM) validate modules/daemon
		$(TERRAFORM) init modules/default && $(TERRAFORM) validate modules/default
		$(TERRAFORM) init modules/fargate && $(TERRAFORM) validate modules/fargate

example:
	$(TERRAFORM) init modules/example && $(TERRAFORM) plan modules/example

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/daemon >./modules/daemon/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/default >./modules/default/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/fargate >./modules/fargate/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/daemon
		$(TERRAFORM) fmt -list=true ./modules/default
		$(TERRAFORM) fmt -list=true ./modules/fargate
