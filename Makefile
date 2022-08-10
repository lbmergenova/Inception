# docker stop $(docker ps -qa)
# docker rm $(docker ps -qa)
# docker rmi -f $(docker images -qa)
# docker volume rm $(docker volume ls -q)

all: up

up:
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp
	@docker-compose -f ./srcs/docker-compose.yml build
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

stop:
	@docker-compose -f srcs/docker-compose.yml stop

start:
	@docker-compose -f srcs/docker-compose.yml start

ps:
	@docker-compose -f srcs/docker-compose.yml ps

fclean:	down
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker system prune -a --force
	sudo rm -Rf /home/${USER}/data

.PHONY:	all up down stop start ps fclean re
