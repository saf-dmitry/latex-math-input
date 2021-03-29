
abbreviations.html: abbreviations.md style.css
	pandoc --standalone --css=style.css --mathjax $< > $@
