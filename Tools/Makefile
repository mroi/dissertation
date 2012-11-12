.PHONY: all style pdf epub force clean

all:
	@echo "choose one of the targets"
	@echo "  check   text consistency checks"
	@echo "  style   highlight weak style in the text"
	@echo "  pdf     compile PDF version"
	@echo "  epub    compile EPUB version"

check: ../Thesis.lyx
	grep -B1 -A1 -w Atlas $< | sed '/^\\noun on$$/,/^\\noun default$$/d' | fgrep --color=auto Atlas

style: Thesis-stylight.pdf
	open $<

pdf: ../Thesis.pdf

epub: Thesis.epub

.INTERMEDIATE: Thesis-stylight.tex Thesis.tex epub/Thesis.ncx epub/Thesis.xhtml

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

../Thesis.pdf: ../Thesis.lyx
	lyx --export pdf4 $<

Thesis.epub: epub/Thesis.ncx epub/Thesis.xhtml
	rm -f $@
	cd $(<D) ; zip -0 ../$@ mimetype
	cd $(<D) ; zip ../$@ META-INF/container.xml $(basename $@).* *.png
	cd $(<D) ; rm *.png

epub/Thesis.ncx: epub/Thesis.xhtml epub/template.ncx
	cp epub/template.ncx $@
	# incredibly ugly and brittle extraction of TOC info from XHTML
	# first line extracts nesting level, label and title
	# second line removes the acknowledgment, adds line numbers and resorts columns
	# third line reformats to navPoint and navLabel tags
	sed -En "/'tocentry'/{s_^<.*'lyxtoc-([0-9])'[^']*'([^']*)'[^>]*>([^<]*)<.*\$$_\1 \2 \3_;p;}" $< | \
		sed 1d | cat -n | sed -E 's/[[:space:]]*([0-9]*)[[:space:]]*([0-9]*)[[:space:]]*(.*)/\2 \1 \3/' | \
		sed -E '2,$$s_^0 _0 </navPoint>_;s_^1 (.*)$$_1 \1</navPoint>_;s_^[0-9] __;s_([0-9]+) _<navPoint playOrder="\1" id="thesis-\1">_;s_(#[^ ]*) _<content src="Thesis.xhtml\1" />_;s_/>([^<]*)_/><navLabel><text>\1</text></navLabel>_' >> $@
	echo '</navPoint></navMap></ncx>' >> $@

epub/Thesis.xhtml: ../Thesis.lyx
	lyx --export xhtml $<
	sed "s_</head>_<link rel='stylesheet' type='text/css' href='Thesis.css' /></head>_; \
		/<a [^>]*>$$/{N;s_\n__;};s_\[_ [_g; \
		s_href='#\([A-Z]\)_href='#LyXCite-\1_g; \
		s_, -[0-9]*\\\\baselineskip__g;s_\\\\raisebox{.*}{\(.*\)}_\1_g;s_\\\\noindent__g; \
		s_MarginFigure_Margin Figure_g;s_Table of Contents_Contents_" < ../$(@F) > $@
	mv $(<D)/*.png $(@D)
	rm $(<D)/$(@F)

../Thesis.lyx: force
	$(MAKE) -C ../Data

clean:
	rm -f Thesis-stylight.pdf
	rm -f Thesis.epub
