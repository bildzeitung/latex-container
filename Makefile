all:
	docker build . -t dmklein/latex:latest

run:
	docker run -it --rm dmklein/latex:latest


.PHONY: all run

default: all
