
bin/memtest: bin
	docker run -t --rm \
		-v `pwd`:/data \
		-w /data \
		debian \
		sh -c 'apt-get update && apt-get install -y gcc && gcc -o bin/memtest memtest.c'

bin:
	mkdir -p bin

oom: | bin/memtest
	docker run -t \
		-v `pwd`/bin:/usr/local/bin \
		debian \
		memtest

# https://fr.wikipedia.org/wiki/Fork_bomb
fork_bomb:
	docker run -t debian perl -e "fork while fork"
