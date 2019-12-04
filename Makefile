DOCKER_HOST   := docker.io
DOCKER_USER := lchenn
ARTIFACT :=  container-libpostal

FULL_NAME   := ${DOCKER_HOST}/${DOCKER_USER}/${ARTIFACT}
GIT_HASH    := $$(git log -1 --pretty=%h)
LATEST := latest
VERSION := 1.0.0

.PHONY: build push login initialize-development pre-commit

build:
	@docker build -t $(FULL_NAME):${GIT_HASH} .
	@docker tag $(FULL_NAME):${GIT_HASH} ${FULL_NAME}:${LATEST}
	@docker tag $(FULL_NAME):${GIT_HASH} ${FULL_NAME}:${VERSION}

push: login
	@docker push ${FULL_NAME}:${LATEST}
	@docker push ${FULL_NAME}:${VERSION}

login:
	@docker login --username $(DOCKER_USER) --password ${DOCKER_PASS}