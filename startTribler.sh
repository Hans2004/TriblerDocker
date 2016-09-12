#!/bin/bash
docker run -ti --name triblervnc -p 5901:5901 -v $HOME/Tribler/Downloads:/root/Downloads \
			    -v $HOME/.Tribler:/root/.Tribler \
			    triblervnc /bin/bash
