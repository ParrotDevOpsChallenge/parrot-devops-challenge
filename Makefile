#!/bin/bash

COMPOSE := docker-compose -f docker-compose.yml
ARG=
ENV=local
ENV_FILE_PATH=secrets/envs.$(ENV).sh

build:
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) build
	@echo "Building..."

up:
	@echo "Server up..."
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) up $(ARG)

superuser:
	@echo "Creating superuser..."
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) run django python manage.py createsuperuser

migrate:
	@echo "Applying migrations ..."
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) run django python manage.py migrate $(ARG)

migrations:
	@echo "Creating migrations ..."
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) run django python manage.py makemigrations $(ARG)

startapp:
	@echo "Creating app"
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) run django python manage.py startapp $(ARG)

test:
	@echo "Running tests with pytest cleaning cache..."
	ENV_FILE_PATH=$(ENV_FILE_PATH) $(COMPOSE) run --rm django bash -c "time DJANGO_ENV=testing python manage.py test $(ARG)"

get-secrets ENV:
	@echo "Fetching secrets..."
	ENV=$(ENV) bash scripts/utils/get-secrets.sh

commit:
	bash scripts/utils/get-commit.sh

