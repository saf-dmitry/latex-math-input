
abbreviations.html: abbreviations.md style.css
	pandoc --self-contained --css=style.css --katex $< > $@
