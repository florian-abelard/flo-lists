#------------------------------------------------------------------------------
# Composer Makefile
#------------------------------------------------------------------------------

composer-exec = docker-compose -f ${DOCKER_COMPOSE_FILE} exec -T --user ${USER_ID} php composer ${1}

#------------------------------------------------------------------------------

ifeq ($(ENV), test)
    COMPOSER_ARGS=--no-interaction
endif

composer-install: vendor ##@composer install / update composer dependencies

composer-dump-autoload: ##@composer dump autoloading
	$(call composer-exec, dump-autoload)

vendor: composer.lock
	$(call composer-exec, install --ignore-platform-reqs ${COMPOSER_ARGS})

composer.lock: composer.json
	$(call composer-exec, update --ignore-platform-reqs ${COMPOSER_ARGS})

#------------------------------------------------------------------------------

clean-composer:##@composer delete vendor directory
	test ! -e vendor || rm -r vendor

#------------------------------------------------------------------------------

.PHONY: composer-install composer-dump-autoload clean-composer
