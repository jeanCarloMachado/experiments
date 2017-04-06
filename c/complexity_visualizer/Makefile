all: clear graphic

clear:
	rm result*

compile:
	gcc main.c -lm -o calculator
run: compile
	./calculator
graphic: run
	run_alias image result.png


