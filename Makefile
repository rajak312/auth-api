GRADLE:=gradle

.PHONY: deps
deps:
	@$(GRADLE) build

PHONY: clean
clean: 
	@$(GRADLE) clean

.PHONY: postgres
postgres:
	@$(MAKE) docker/postgres

dev:  postgres +dev
+dev:
	@${GRADLE} build --continuous & ${GRADLE} bootRun

.PHONY: docker/%
docker/%:
	@$(MAKE) -sC docker $(subst docker/,,$@) ARGS=$(ARGS)