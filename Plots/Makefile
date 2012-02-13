VEUSZ = $(wildcard *.vsz)

.PHONY: all clean

all:: $(VEUSZ:.vsz=.pdf)

%.pdf: %.vsz
	veusz --export="$(dir $(realpath $<))/$@" "$(realpath $<)"

clean::
	rm -f *.pdf

all clean::
	@for i in * ; do ! test -d "$$i" || $(MAKE) -C "$$i" $@ ; done
