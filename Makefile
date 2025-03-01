COMPOSE_FILE = ./srcs/docker-compose.yml
SSL_DIR = ./srcs/requirements/nginx/ssl

getssl:
	mkdir ./srcs/requirements/nginx/ssl
	openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes \
	-subj "/C=KR/ST=Seoul/L=Gaepo-dong/O=42Seoul/OU=cadet/CN=sangshin/"


all: $(COMPOSE_FILE) $(SSL_DIR)
	docker compose -f $(COMPOSE_FILE) up --build

clean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans


fclean: clean
	rm -rf ./srcs/database
	rm -rf ./srcs/wordpress
	rm -rf $(SSL_DIR)
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

.PHONY: all clean fclean
