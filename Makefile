FORMS=eu-controller-non-eu-processor

all: $(FORMS:=.docx) $(FORMS:=.pdf)

%.docx: %.cform %.json %.options styles.json
	npx commonform render -f docx $(shell cat $*.options) $< --styles styles.json > $@

%.pdf: %.docx
	unoconv $<
