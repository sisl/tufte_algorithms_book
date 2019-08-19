test:
	julia --color=yes pull_julia_code.jl
	julia --color=yes runtests.jl
compile:
	julia --color=yes pull_julia_code.jl
	lualatex book
	pythontex book
	biber book
	lualatex book
clean:
	find . -type f -name "*.aux" -exec rm -f {} \;
	rm -f book.bbl book.blg book.bcf book.idx book.log book.out book.pytxcode book.run.xml book.toc
	rm -f all_algorithm_blocks.jl all_juliaconsole_blocks.jl all_test_blocks.jl
	rm -rf pythontex-files-book
