
LOGIN=ren-nasr

all: mkdirs
	cd ./srcs && sudo docker-compose up

mkdirs:
	mkdir -p /home/$(LOGIN)/data/db
	mkdir -p /home/$(LOGIN)/data/wp

clean:
	cd ./srcs && sudo docker-compose down
	sudo rm -rf /home/$(LOGIN)/data/db
	sudo rm -rf /home/$(LOGIN)/data/wp

re: clean all

.PHONY: all clean re
