POSTGRES_USERNAME := postgres
POSTGRES_PASSWORD := admin
POSTGRES_HOSTNAME := localhost
POSTGRES_PORT := 5432
POSTGRES_DATABASE := dentist_app

export POSTGRES_URL := postgresql://${POSTGRES_USERNAME}:${POSTGRES_PASSWORD}@${POSTGRES_HOSTNAME}:${POSTGRES_PORT}/${POSTGRES_DATABASE}?sslmode=prefer

.PHONY: wait_for_postgres
wait_for_postgres:
	@echo 'waiting for postgres...' && \
	until PGPASSWORD=$(POSTGRES_PASSWORD) psql -h $(POSTGRES_HOSTNAME) -U $(POSTGRES_USERNAME) -d $(POSTGRES_DATABASE) -c '\q'; do \
		sleep 1; \
	done; \
	sleep 1 && echo "postgres ready"

.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down

.PHONY: postgres-server
postgres-server:
	@docker-compose up -d postgres

.PHONY: postgres
postgres: postgres-server wait_for_postgres
