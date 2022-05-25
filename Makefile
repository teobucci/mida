PRINCIPALE = main
PRINCIPALE_TEX = $(PRINCIPALE).tex
PRINCIPALE_PDF = $(PRINCIPALE).pdf
FILE_CLEAN = *.aux *.log *.out *.xdv *.toc *.fls *.fls *.fdb_latexmk
FILE_DISTCLEAN =  $(PRINCIPALE_PDF)

.PHONY: distclean clean pdf

pdf: $(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(PRINCIPALE_TEX)
	git show -s --pretty="%T" HEAD > commit_hash.part
	latexmk -pdf $(PRINCIPALE_TEX)

clean:
	rm -f $(FILE_CLEAN)

distclean : clean
	rm -f $(FILE_DISTCLEAN)