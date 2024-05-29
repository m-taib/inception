all :
	@mkdir -p /home/mtaib/data/wordpress /home/mtaib/data/db 
	@docker-compose -f src/docker-compose.yml up -d 
re : 
	@docker-compose -f src/docker-compose.yml down -v
	@sudo rm -rf /home/mtaib/data/wordpress/*
	@sudo rm -rf /home/mtaib/data/db/*
	@docker-compose -f src/docker-compose.yml up -d --build

fclean :
	@docker-compose -f src/docker-compose.yml down -v
	@sudo rm -rf /home/mtaib/data/*
	@docker system prune -af
	
rebuild: fclean all
