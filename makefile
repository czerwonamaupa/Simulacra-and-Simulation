default : index.html simulacra-and-simulation.mobi

web.css : styles/index.css styles/html.css
	cat styles/index.css > web.css && cat styles/html.css >> web.css

index.html : chapters/* web.css filters/* template.t
	pandoc \
	-s \
	--filter filters/hyphenate.py \
	--section-divs \
	-o index.html \
	-c web.css \
	--template template.t \
	chapters/*

ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > ebook.css && cat styles/epub.css >> ebook.css

simulacra-and-simulation.epub : chapters/* ebook.css filters/* template.t cover.jpg
	pandoc \
	-s \
	--filter filters/hyphenate.py \
	--section-divs \
	--toc-depth=2 \
	--epub-cover-image cover.jpg \
	-o simulacra-and-simulation.epub \
	-c ebook.css \
	--template template.t \
	-t epub3 \
	chapters/*

simulacra-and-simulation.mobi : simulacra-and-simulation.epub
	kindlegen simulacra-and-simulation.epub

clean :
	$(RM) simulacra-and-simulation.epub simulacra-and-simulation.mobi index.html web.css ebook.css
