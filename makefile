default : index.html simulacra-and-simulation.epub simulacra-and-simulation.mobi

index.html : chapters/* index.css html.css template.t
	pandoc \
			-s \
			--section-divs \
			-o index.html \
			-c index.css \
			-c html.css \
			--template template.t \
			chapters/*

simulacra-and-simulation.epub : chapters/* index.css epub.css template.t cover.jpg
	pandoc \
			-s \
			--section-divs \
			--toc-depth=1 \
			--epub-cover-image cover.jpg \
			-o simulacra-and-simulation.epub \
			-c index.css \
			-c epub.css \
			--template template.t \
			chapters/*

simulacra-and-simulation.mobi : simulacra-and-simulation.epub cover.jpg
	ebook-convert simulacra-and-simulation.{epub,mobi} --cover cover.jpg
