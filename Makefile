.PHONY: install
## npm install
install:
	npm install

.PHONY: clean
## rm -rf build
clean:
	rm -rf build

.PHONY: build
## npm run asbuild
build:
	npx asc assembly/index.ts --target release

.PHONY: run
## node main.js
run:
	node main.js

.DEFAULT_GOAL := help
.PHONY: help
help:
	@echo "$$(tput setaf 2)Available rules:$$(tput sgr0)";sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## /---/;td" -e"s/:.*//;G;s/\\n## /===/;s/\\n//g;p;}" ${MAKEFILE_LIST}|awk -F === -v n=$$(tput cols) -v i=4 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"- %s%s%s\n",a,$$1,z;m=split($$2,w,"---");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;}printf"%*s%s\n",-i," ",w[j];}}'