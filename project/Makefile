NAME = ./srcs/docker-compose.yml 
run : 
	mkdir -p srcs/WP srcs/DB
	docker-compose -f $(NAME) up --build 
clean : 
	docker-compose -f $(NAME) down -v --rmi all 
	rm -rf srcs/WP  srcs/DB 
	docker system prune -af

