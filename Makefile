SERVER_DIR = '/srv/http/'

R := '\033[31m'
ifneq (, $(shell command -v lolcat))
	R := | lolcat
endif

RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

WARNING := "[${RED}!${RESET}]"
SUCCESS := "[${GREEN}+${RESET}]"

.SILENT:

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

dist: header
	# Build server
	mkdir -p dist
	echo '<p>Hello, World!</p>' > dist/index.html
	echo -e "$(WARNING) not implemented yet"

$(SERVER_DIR): header dist
	# Copy server files
	cp -r dist/* $(SERVER_DIR)
	echo "Server files copied to $(SERVER_DIR)"


install: header $(SERVER_DIR)
	$(HEADER_TEXT)


uninstall: header
	rm -rf $(SERVER_DIR)

.PHONY: header clean distclean install uninstall
