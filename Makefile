.PHONY: build run exec

build:
	docker build -t debug-py .

run: build
	docker run --name debug-py \
		-dit \
		-v $(shell pwd):/usr/src/app \
		-p 5678:5678 \
		debug-py sh

exec:
	docker exec -it debug-py sh


