
LOGIN=ren-nasr
DIR=/home/$(LOGIN)/data

all: mkdirs
	cd ./srcs && sudo docker-compose up
all: mkdirs
	cd ./srcs && sudo docker-compose up

rebuild: mkdirs
	cd ./srcs && sudo docker-compose up --build
	cd ./srcs && sudo docker-compose up --build

mkdirs:
	test -d $(DIR)/db || mkdir -p $(DIR)/db
	test -d $(DIR)/wp || mkdir -p $(DIR)/wp


clean:
	cd ./srcs && sudo docker-compose down

fclean: clean
	sudo rm -rf $(DIR)

re: fclean all


.PHONY: all clean re
