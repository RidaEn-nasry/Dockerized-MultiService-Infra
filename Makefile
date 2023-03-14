
LOGIN=ren-nasr

all: mkdirs
	cd ./srcs && sudo docker-compose up -d

mkdirs:
	sudo mkdir -p /home/$(LOGIN)/data/db
	sudo mkdir -p /home/$(LOGIN)/data/wp

clean:
	cd ./srcs && docker-compose down
	rm -rf /home/$(LOGIN)/data/db
	rm -rf /home/$(LOGIN)/data/wp

re: clean all

.PHONY: all clean re
