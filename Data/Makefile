VEUSZ = $(wildcard *.vsz)
SCILAB = $(wildcard *.sci)

.PHONY: all clean force

all:: $(VEUSZ:.vsz=.pdf) $(SCILAB:.sci=.lyx)

%.pdf: %.vsz
	veusz --export="$(dir $(realpath $<))/$*_.pdf" "$(realpath $<)"
	# Veusz sometimes slightly clips content on the very right
	# change the MediaBox to make PDFs a little wider
	box="`podofopdfinfo $*_.pdf | perl -e ' \
		while (<STDIN>) { \
			if (/MediaBox: \[ ([0-9]*)\.[0-9]* ([0-9]*)\.[0-9]* ([0-9]*)\.[0-9]* ([0-9]*)\./) { \
				printf("%d00 %d00 %d00 %d00\n", $$1, $$2, $$3 - $$1 + 1, $$4 - $$2); \
				break; \
			} \
		}'`" ; \
	podofobox $*_.pdf $@ media $$box
	rm $*_.pdf

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
	
