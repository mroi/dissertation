all: Thesis-stylight.pdf
	open $<

.INTERMEDIATE: Thesis-stylight.tex Thesis.tex

Thesis-stylight.pdf: Thesis-stylight.tex
	ln -sf ../Figures ./
	xelatex $<
	-for fig in Figures/* ; do test -e "$${fig%.pdf}.svg" && rm "$$fig" ; done
	rm Figures
	rm $(basename $@).{aux,idx,lof,log,lot,out,toc}

Thesis-stylight.tex: Thesis.tex
	./stylight.pl < $< > $@

Thesis.tex: ../Thesis.lyx
	lyx --export xetex $<
	mv ../$@ ./
