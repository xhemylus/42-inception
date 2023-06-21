#***** VARIABLES *****#

PROJECT = Inception
NAME = inception
HOST = "127.0.0.1	abollen.42.fr"
WORKDIR = /home/abollen/data

#***** RULES *****#

all : init
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml up -d

init :
	@test ! -d ${DATADIR} && mkdir ${DATADIR} && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${DATADIR}" || true
	@test ! -d ${DATADIR}/wordpress && mkdir ${DATADIR}/wordpress && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${DATADIR}/wordpress" || true
	@test ! -d ${DATADIR}/mariadb && mkdir ${DATADIR}/mariadb && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${DATADIR}/mariadb" || true
	@test ! `grep -q ${HOST} /etc/hosts` && echo ${HOST} >> /etc/hosts && echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0mhost" || true

stop :
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml down 

re: stop all

.PHONY : all stop re