VEUSZ = $(wildcard *.vsz)
SCILAB = $(wildcard *.sci)

.PHONY: all clean force

all:: $(VEUSZ:.vsz=.pdf) $(SCILAB:.sci=.tex)

%.pdf: %.vsz
	veusz --export="$(dir $(realpath $<))/$@" "$(realpath $<)"

%.tex: %.sci
	rm -f $@
	scilab -nw -nb -f $<
	sed -i_ '1i\'$$'\n''\\tabularnewline\\midrule\\midrule'$$'\n''s/^ //;$$b'$$'\n''s/$$/\\tabularnewline/' $@
	rm -f $@_

%.log: force
	$(MAKE) -C "$(shell dirname "`readlink "$@"`")" "$(shell basename "`readlink "$@"`")"

clean::
	rm -f *.pdf

all clean::
	@for i in * ; do ! test -d "$$i" || $(MAKE) -C "$$i" $@ ; done

force:
	
