#/bin/bash
docker exec -it $(docker ps | grep mymongo | grep -Eow "^[abcdef0-9]*") bash
