PRINCIPALE = main
PRINCIPALE_TEX = $(PRINCIPALE).tex
PRINCIPALE_PDF = $(PRINCIPALE).pdf
FILE_CLEAN = *.aux *.log *.out *.xdv *.toc *.fls *.fls *.fdb_latexmk *.synctex.gz *.synctex\(busy\)
FILE_DISTCLEAN =  $(PRINCIPALE_PDF)

.PHONY: distclean clean pdf

pdf: $(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(PRINCIPALE_TEX) *.tex
	git show -s --format=%H > commit_hash.part
	latexmk -pdf -jobname=$(PRINCIPALE) $(PRINCIPALE_TEX)
	rm -f commit_hash.part

clean:
	rm -f $(FILE_CLEAN) commit_hash.part

distclean : clean
	rm -f $(FILE_DISTCLEAN)