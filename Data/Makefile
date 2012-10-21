VEUSZ = $(wildcard *.vsz)
SCILAB = $(wildcard *.sci)

.PHONY: all clean force

all:: $(VEUSZ:.vsz=.pdf) $(SCILAB:.sci=.lyx)

%.pdf: %.vsz
	veusz --export="$(dir $(realpath $<))/$@" "$(realpath $<)"

%.lyx: %.tab ../tab2lyx.pl
	../tab2lyx.pl < $< > $@

%.tab: %.sci
	rm -f $@
	scilab -nw -nb -f $<

%.log: force
	$(MAKE) -C "$(shell dirname "`readlink "$@"`")" "$(shell basename "`readlink "$@"`")"

clean::
	rm -f *.pdf

all clean::
	@for i in * ; do ! test -d "$$i" || $(MAKE) -C "$$i" $@ ; done

force:
	
