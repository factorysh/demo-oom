
bin/memtest: bin
	docker run -ti --rm \
		-v `pwd`:/data \
		-w /data \
		debian \
		sh -c 'apt-get update && apt-get install -y gcc && gcc -o bin/memtest memtest.c'

bin:
	mkdir -p bin
