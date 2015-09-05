.PHONY=pdf

# := variables are simply expanded, which means only once
# http://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html 
TMP_DIR:="$(shell mktemp -d)"

all: pdf

pdf: message.tex
	xelatex -output-directory=$(TMP_DIR) $<
	mv $(TMP_DIR)/message.pdf .
	rm -r $(TMP_DIR)
