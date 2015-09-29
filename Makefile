.PHONY=clean

# := variables are simply expanded, which means only once
# http://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html 
TMP_DIR:="$(shell mktemp -d)"

all: $(addsuffix .pdf, $(basename $(wildcard *.tex)))

%.pdf:
	xelatex -output-directory=$(TMP_DIR) $(basename $@).tex
	xelatex -output-directory=$(TMP_DIR) $(basename $@).tex
	mv "$(TMP_DIR)/$@" .
	rm -r $(TMP_DIR)

clean:
	rm -f $(addsuffix .pdf, $(basename $(wildcard *.tex)))
