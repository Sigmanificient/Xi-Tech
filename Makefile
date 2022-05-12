LOCAL_SERVER_DIR = '/srv/http/'

R := '\033[31m'
ifneq (, $(shell command -v lolcat))
	R := | lolcat
endif

RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

WARNING := "[${RED}!${RESET}]"
SUCCESS := "[${GREEN}+${RESET}]"


all: header install clean


header:
	echo -e '\nXi-Tech - By Sigmanificient\n' $(R)


distclean: clean header
	rm -f server/.env server/.env.local
	rm -f client/package-lock.json


clean: header
	# Remove old build
	rm -rf dist

	# Remove client build & node_modules
	rm -rf client/dist client/node_modules
	rm -rf server/build server/vendor


dist: header server/build
	# Build server
	mkdir -p dist
	cp -r server/build/* dist


server/composer.lock:
	composer update -d server


server/composer.json:
	composer install -d server


server/vendor: server/composer.lock server/composer.json


server/build: server/vendor
	mkdir -p server/build

	cp -r server/app server/build
	cp -r server/core server/build
	cp -r server/public server/build
	cp -r server/composer.json server/build

	echo '*' > server/build/.gitignore


$(LOCAL_SERVER_DIR): header dist
	# Copy server files
	cp -r dist/* $(LOCAL_SERVER_DIR)
	echo "Server files copied to $(LOCAL_SERVER_DIR)"


install: header $(LOCAL_SERVER_DIR)


uninstall: header
	rm -rf $(LOCAL_SERVER_DIR)/*


.PHONY: header clean distclean install uninstall
