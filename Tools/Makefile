.PHONY: all style pdf epub force clean

all:
	@echo "choose one of the targets"
	@echo "  check   text consistency checks"
	@echo "  style   highlight weak style in the text"
	@echo "  pdf     compile PDF version"
	@echo "  print   compile PDF version for print"
	@echo "  epub    compile EPUB version"

check:
	grep -B1 -A1 -w Atlas ../Thesis.lyx | sed '/^\\noun on$$/,/^\\noun default$$/d' | fgrep --color=auto Atlas
	fgrep --color=auto H.264 ../Thesis.lyx
	grep Booktitle ../Bibliography/Thesis.bib | sed 's/^[[:space:]]Booktitle = {//;s/^Proceedings of the //;s/^[12][0-9][0-9][0-9] //;s/^[0-9]*\\textsuperscript{[snrt][tdh]} //;s/},$$//' | sort | uniq -c

style: Thesis-stylight.pdf
	open $<

pdf: ../Thesis.pdf

print: Thesis-print.pdf

epub: Thesis.epub

.INTERMEDIATE: Thesis-stylight.tex Thesis.tex epub/Thesis.ncx epub/Thesis.xhtml

Thesis-stylight.pdf: Thesis-stylight.tex
	ln -sf ../Data ../Figures ./
	xelatex $<
	rm Data/*/*.tex Figures/*/*.pdf Data Figures
	rm $(basename $@).{aux,idx,lof,log,lot,out,toc}

Thesis-stylight.tex: Thesis.tex
	./stylight.pl < $< > $@

Thesis.tex: ../Thesis.lyx
	lyx --export xetex $<
	mv ../$@ ./

../Thesis.pdf: ../Thesis.lyx
	lyx --export pdf4 $<

Thesis-print.pdf: ../Thesis.pdf empty.pdf
	pdfopt $< $@-1  # PoDoFo otherwise barks about problems in the PDF
	podofopages $@-1 $@-2 --delete 0 --delete 118  # delete cover pages
	podofomerge empty.pdf $@-2 $@-3  # add empty front cover page
	podofomerge $@-3 empty.pdf $@-4  # add empty back cover page
	podofobox $@-4 $@-5 media -850 -850 61228 85890  # add 3mm margins with bleed
	podofobox $@-5 $@-6 bleed -850 -850 61228 85890  # add bleed box
	podofobox $@-6 $@ trim 0 0 59528 84189  # add trim box
	rm $@-[1-6]

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

%.pdf: %.tex
	pdflatex $<
	rm $*.aux $*.log

clean:
	rm -f *.pdf *.epub
