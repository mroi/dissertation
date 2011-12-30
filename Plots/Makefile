VEUSZ = $(wildcard *.vsz)

all: $(VEUSZ:.vsz=.pdf)

%.pdf: %.vsz
	veusz --export="$(PWD)/$@" "$(PWD)/$<"
