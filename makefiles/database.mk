#------------------------------------------------------------------------------
# Database Makefile
#------------------------------------------------------------------------------

database-admin-exec = docker-compose -f ${DOCKER_COMPOSE_FILE} exec -T --user root db ${1}

#------------------------------------------------------------------------------

db-init: db-create db-populate ##@database create and populate database

db-create: ##@database Create postgresql database and schema
	$(call database-admin-exec, env PGPASSWORD=${DATABASE_ADMIN_PASSWORD} psql --echo-all --username=${DATABASE_ADMIN} --file="/var/data/sql/01-system.sql")
	$(call database-admin-exec, env PGPASSWORD=${DATABASE_USER_PASSWORD} psql --echo-all --username=${DATABASE_USER} --dbname=${DATABASE_NAME} --file="/var/data/sql/02-schema.sql")

# db-populate: ##@database filled database with sample data
	# $(call ddatabase-admin-exec, PGPASSWORD=${DATABASE_USER_PASSWORD} psql --echo-all --username=${DATABASE_USER} --file="data/sql/03-data.sql")

#------------------------------------------------------------------------------

clean-db: ##@database clean database TODO?

#------------------------------------------------------------------------------

.PHONY: db-init db-create db-populate
