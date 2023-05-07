NAME = ./srcs/docker-compose.yml 
run : 
	docker-compose -f $(NAME) up --build 
	mkdir -p WordPress DB
clean : 
	docker-compose -f $(NAME) down --rmi all 
	rm -rf WordPress DB 
	docker system prune -af

