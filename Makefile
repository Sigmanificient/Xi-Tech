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
	@ echo -e '\nXi-Tech - By Sigmanificient\n' $(R)


distclean: clean header
	@ rm -f server/.env server/.env.local
	@ rm -f client/package-lock.json


clean: header
	@ # Remove old build
	@ rm -rf dist

	@ # Remove client build & node_modules
	@ rm -rf server/build


server/composer.lock:
	@ composer update -d server

server/vendor: server/composer.lock server/composer.json
	@ composer install -d server


server/build: server/vendor
	@ mkdir -p server/build

	@ cp -r server/api server/build
	@ cp -r server/core server/build
	@ cp -r server/public server/build
	@ cp -r server/composer.json server/build

	@ echo '*' > server/build/.gitignore


client/dist: client/node_modules
	@ npm run build --prefix client


client/node_modules: client/package-lock.json
	@ npm install --prefix client


dist: header server/build client/dist
	@ # Build server
	@ mkdir -p dist
	@ cp -r server/build/* dist
	@ cp -r client/dist/* dist/public


$(LOCAL_SERVER_DIR): header dist
	@ # Copy server files
	@ cp -r dist/* $(LOCAL_SERVER_DIR)
	@ echo "Server files copied to $(LOCAL_SERVER_DIR)"


install: header $(LOCAL_SERVER_DIR)

reinstall:
	make clean
	make install
	cd /srv/http/ && composer update
	make clean


uninstall: header
	@ rm -rf $(LOCAL_SERVER_DIR)/*


.PHONY: header clean distclean install uninstall
