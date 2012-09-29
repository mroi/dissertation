all:
	@echo "choose one of the targets"
	@echo "  style   highlight weak style in the text"

style: Thesis-stylight.pdf
	open $<

.INTERMEDIATE: Thesis-stylight.tex Thesis.tex

Thesis-stylight.pdf: Thesis-stylight.tex
	ln -sf ../Data ../Figures ./
	xelatex $<
	svn st Data Figures | cut -c9- | while read file ; do rm "$$file" ; done
	rm Data Figures
	rm $(basename $@).{aux,idx,lof,log,lot,out,toc}

Thesis-stylight.tex: Thesis.tex
	./stylight.pl < $< > $@

Thesis.tex: ../Thesis.lyx
	lyx --export xetex $<
	mv ../$@ ./

clean:
	rm -f Thesis-stylight.pdf
