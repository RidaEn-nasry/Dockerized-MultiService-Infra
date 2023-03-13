

# a rule to create direcotproes

LOGIN=ren-nasr
mkdirs:
	mkdir -p /home/$(LOGIN)/data/db
	mkdir -p /home/$(LOGIN)/data/wp

all: mkdirs
	cd ./srcs && docker-compose up -d
	
clean:
	cd ./srcs && docker-compose down
	rm -rf /home/$(LOGIN)/data/db
	rm -rf /home/$(LOGIN)/data/wp

re: clean all

.PHONY: all clean re
