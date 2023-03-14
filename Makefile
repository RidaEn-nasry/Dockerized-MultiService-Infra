
LOGIN=ren-nasr
DIR=/Users/ren-nasr/porn/data/
#DIR=/home/$(LOGIN)/data

#cd ./srcs && sudo docker-compose up
all: mkdirs
	cd ./srcs && docker-compose up

rebuild: mkdirs
	cd ./srcs && docker-compose up --build

mkdirs:
	test -d $(DIR)/db || mkdir -p $(DIR)/db
	test -d $(DIR)/wp || mkdir -p $(DIR)/wp


#cd ./srcs && sudo docker-compose down
clean:
	cd ./srcs && docker-compose down
	rm -rf $(DIR)
re: clean all

.PHONY: all clean re
