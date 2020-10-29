# haxyier/aws-tools
TOOLS_CMD=docker-compose -f .docker/aws-tools/docker-compose.yml
USER_NAME=$(shell sed -n 4p ./.docker/aws-tools/docker-compose.yml | sed 's/^[ \t]*//')

build-tools:
	$(TOOLS_CMD) build --no-cache

start-tools:
	$(TOOLS_CMD) up -d

exec-tools: start-tools
	$(TOOLS_CMD) exec --user $(USER_NAME) aws-tools /bin/bash

stop-tools:
	$(TOOLS_CMD) down

clean-tools:
	$(TOOLS_CMD) rm

ps-tools:
	$(TOOLS_CMD) ps

image-tools:
	$(TOOLS_CMD) images
