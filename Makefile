FORMS=eu-controller-non-eu-processor

all: $(FORMS:=.docx) $(FORMS:=.pdf)

%.docx: %.cform %.json %.options
	npx commonform render -f docx $(shell cat $*.options) $< > $@

%.pdf: %.docx
	unoconv $<
