default : index.html books/simulacra-and-simulation.mobi

index.html : chapters/* styles/index.css styles/html.css template.t
	pandoc \
			-s \
			--section-divs \
			-o index.html \
			-c styles/index.css \
			-c styles/html.css \
			--template template.t \
			chapters/*

styles/ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > styles/ebook.css && cat styles/epub.css >> styles/ebook.css

ebooks/simulacra-and-simulation.epub : chapters/* styles/index.css styles/ebook.css template.t cover.jpg
	pandoc \
			-s \
			--section-divs \
			--toc-depth=2 \
			--epub-cover-image cover.jpg \
			-o ebooks/simulacra-and-simulation.epub \
			-c styles/ebook.css \
			--epub-embed-font 'fonts/*' \
			--template template.t \
			-t epub3 \
			chapters/*

ebooks/simulacra-and-simulation.mobi : ebooks/simulacra-and-simulation.epub
	kindlegen ebooks/simulacra-and-simulation.epub
