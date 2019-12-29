#------------------------------------------------------------------------------
# Docker Makefile
#------------------------------------------------------------------------------

build: ##@docker build containers
	docker-compose -f ${DOCKER_COMPOSE_FILE} build

up: .env ##@docker build and start containers
	docker-compose -f ${DOCKER_COMPOSE_FILE} up

down: ##@docker stop and remove containers and volumes
	docker-compose -f ${DOCKER_COMPOSE_FILE} down --volumes

rebuild: build up ##@docker rebuild and start containers

bash-web: ##@docker open a bash session in the web container
	docker-compose -f ${DOCKER_COMPOSE_FILE} exec web /bin/bash

bash-php: ##@docker open a bash session in the web container
	docker-compose -f ${DOCKER_COMPOSE_FILE} exec php /bin/bash

#------------------------------------------------------------------------------

clean-docker: down ##@docker clean docker containers
	docker container ls -a | grep "${APP_NAME}" | awk '{print $1}' | xargs --no-run-if-empty docker container rm
	docker image rm $(docker images -a -q)

#------------------------------------------------------------------------------

.PHONY: up build down rebuild connect clean-docker
