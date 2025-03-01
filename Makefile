COMPOSE_FILE = ./srcs/docker-compose.yml
SSL_DIR = ./srcs/requirements/nginx/ssl

all: $(COMPOSE_FILE)
	@if [ ! -d "$(SSL_DIR)" ]; then $(MAKE) getssl; fi
	docker compose -f $(COMPOSE_FILE) up --build &

getssl:
	@mkdir -p $(SSL_DIR)
	@openssl req -x509 -newkey rsa:4096 -keyout $(SSL_DIR)/server.key -out $(SSL_DIR)/server.crt -days 365 -nodes \
	-subj "/C=KR/ST=Seoul/L=Gaepo-dong/O=42Seoul/OU=cadet/CN=sangshin/" -quiet


clean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans

fclean: clean
	rm -rf ./data
	rm -rf $(SSL_DIR)
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

.PHONY: all clean fclean getssl

