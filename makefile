CHAPTER :=
test:
	julia --project --color=yes pull_julia_code.jl
	julia --project --color=yes runtests.jl
compile:
ifdef CHAPTER
	cp book.tex book.tex.bak
	vim \
	 -c ':/\\begin{document}/,/\\end{document}/s/\(^.*\\\(input\|include\).*$$\)/%\1/' \
	 $(foreach var,$(CHAPTER),-c ':g/\(chapter\|appendix\)\/$(var)/s/^.//' ) \
	 -c :wq \
	 book.tex
endif
	-julia --project --color=yes pull_julia_code.jl && \
	lualatex book && \
	pythontex book && \
	biber book && \
	lualatex book
ifdef CHAPTER
	mv book.tex.bak book.tex
endif
clean:
	find . -type f -name "*.aux" -exec rm -f {} \;
	rm -f book.bbl book.blg book.bcf book.idx book.log book.out book.pytxcode book.run.xml book.toc
	rm -f all_algorithm_blocks.jl all_juliaconsole_blocks.jl all_test_blocks.jl
	rm -rf pythontex-files-book
