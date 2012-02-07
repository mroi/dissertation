VEUSZ = $(wildcard *.vsz)

.PHONY: all clean

all:: $(VEUSZ:.vsz=.pdf)

%.pdf: %.vsz
	veusz --export="$(PWD)/$@" "$(PWD)/$<"

clean::
	rm -f *.pdf

all clean::
	for i in * ; do ! test -d "$$i" || PWD="$(PWD)/$$i" $(MAKE) -C "$$i" $@ ; done
