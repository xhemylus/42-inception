#***** VARIABLES *****#

PROJECT = Inception
NAME = inception
HOST = "127.0.0.1	abollen.42.fr"
WORKDIR = /home/abollen/data

#***** RULES *****#

all : init
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml up -d

init :
	@test ! -d ${WORKDIR} && mkdir ${WORKDIR} && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${WORKDIR}" || true
	@test ! -d ${WORKDIR}/wordpress && mkdir ${WORKDIR}/wordpress && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${WORKDIR}/wordpress" || true
	@test ! -d ${WORKDIR}/mariadb && mkdir ${WORKDIR}/mariadb && echo "\033[36m[${PROJECT}]\033[93m[CREATE] \033[0m${WORKDIR}/mariadb" || true
	@test ! `grep -q ${HOST} /etc/hosts` && echo ${HOST} >> /etc/hosts && echo "\033[36m[${PROJECT}]\033[93m[INIT] \033[0mhost" || true

stop :
	docker compose --env-file=srcs/.env --file=srcs/docker-compose.yml down 

re: stop all

.PHONY : all stop re