# Makefile to build resume.pdf from README.md using Pandoc and eisvogel template

PDF=resume.pdf
MD=README.md
TEMPLATE=eisvogel.latex
PASSOPTIONS=passoptions.latex
FONTS=fonts.latex

all: $(PDF)

$(PDF): $(MD)
	cat $(MD) | sed 's/ username on the UCSD domain /@/g' | pandoc \
	  --from markdown \
	  --template=$(TEMPLATE) \
	  --pdf-engine=xelatex \
	  --variable colorlinks=true \
	  --variable mainfont="DejaVu Sans" \
	  --variable fontsize=10pt \
	  --output=$(PDF)

clean:
	rm -f $(PDF)
