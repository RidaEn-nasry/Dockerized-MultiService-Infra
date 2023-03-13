


# a rule to install docker if not installed
docker-install:

# a rule to create direcotproes
LOGIN=ren-nasr


docker-install:
	apt-get update
	apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	mkdir -m 0755 -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
  	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	apt-get install docker-compose-plugin

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
