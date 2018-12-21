default : index.html ebooks/simulacra-and-simulation.mobi

index.html : chapters/* styles/index.css styles/html.css filters/* template.t
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			-o index.html \
			-c styles/index.css \
			-c styles/html.css \
			--template template.t \
			chapters/*

styles/ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > styles/ebook.css && cat styles/epub.css >> styles/ebook.css

ebooks/simulacra-and-simulation.epub : chapters/* styles/ebook.css filters/* template.t cover.jpg
	pandoc \
			-s \
			--filter filters/hyphenate.py \
			--section-divs \
			--toc-depth=2 \
			--epub-cover-image cover.jpg \
			-o ebooks/simulacra-and-simulation.epub \
			-c styles/ebook.css \
			--template template.t \
			-t epub3 \
			chapters/*

ebooks/simulacra-and-simulation.mobi : ebooks/simulacra-and-simulation.epub
	kindlegen ebooks/simulacra-and-simulation.epub

clean :
	$(RM) ebooks/* index.html styles/ebook.css
