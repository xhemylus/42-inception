if [ ! $# -eq 2 ]; then
	echo "Usage: sh reset.sh [path to volumes] [network name]"
	exit 1
fi

echo "Cleaning up..."

[ -f "docker-compose.yml" ] && docker compose down

[ "$(docker ps -aq)" ] && docker stop $(docker ps -aq)

[ "$(docker ps -aq)" ] && docker rm -vf $(docker ps -aq)

[ "$(docker images -aq)" ] && docker rmi -f $(docker images -aq)

[ "$(docker volume ls -q)" ] && docker volume rm $(docker volume ls -q)

[ "$(docker network ls | grep inception)" ] && docker network rm $2

[ "$(ls -A $1/mariadb)" ] && sudo rm -rf $1/mariadb/*

[ "$(ls -A $1/wordpress)" ] && sudo rm -rf $1/wordpress/*

echo "\r\033[0KAll done!"