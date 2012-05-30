VEUSZ = $(wildcard *.vsz)

.PHONY: all clean force

all:: $(VEUSZ:.vsz=.pdf)

%.pdf: %.vsz
	veusz --export="$(dir $(realpath $<))/$@" "$(realpath $<)"

%.log: force
	$(MAKE) -C "$(shell dirname "`readlink "$@"`")" "$(shell basename "`readlink "$@"`")"

clean::
	rm -f *.pdf

all clean::
	@for i in * ; do ! test -d "$$i" || $(MAKE) -C "$$i" $@ ; done

force:
	
