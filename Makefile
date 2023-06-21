#***** VARIABLES *****#

PROJECT = Inception
NAME = inception
HOST = "127.0.0.1	abollen.42.fr"
WORKDIR = /home/abollen/data

#***** RULES *****#

all : 
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml up -d

init :
	mkdir ${WORKDIR} && @echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0m${WORKDIR} folder"
	mkdir ${WORKDIR}/wordpress && @echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0m${WORKDIR}/wordpress folder"
	mkdir ${WORKDIR}/mariadb && @echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0m${WORKDIR}/mariadb folder"
	@test ! `grep -q ${HOST} /etc/hosts` && echo ${HOST} >> /etc/hosts && echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0mhost" || true

stop :
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml down 

re: stop all

.PHONY : all stop re