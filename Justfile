# Pin Julia 1.10 — Weave.jl (used by pythontex's juliaconsole) is
# incompatible with Julia 1.12+.
julia := "julia +1.10"

# Install all dependencies (Julia packages, Python venv, lexer/style)
setup:
    git submodule update --init
    {{julia}} --project -e 'using Pkg; Pkg.instantiate()'
    test -d .venv || uv venv --python 3.13
    uv pip install --python .venv/bin/python ./style ./lexer

# Compile the full book
# lualatex returns non-zero due to tufte-latex + TeX Live 2025+ warnings;
# the PDF is still produced correctly.
compile: pull-code _ensure-venv
    -lualatex -interaction=nonstopmode book
    .venv/bin/python "$(which pythontex)" --interpreter "julia:julia +1.10" book
    biber book
    -lualatex -interaction=nonstopmode book

# Compile a single chapter, e.g.: just chapter introduction
# Pass the name without the chapter/ prefix or .tex extension.
chapter name: pull-code _ensure-venv
    -lualatex -interaction=nonstopmode "\includeonly{chapter/{{name}}}\input{book}"
    .venv/bin/python "$(which pythontex)" --interpreter "julia:julia +1.10" book
    biber book
    -lualatex -interaction=nonstopmode "\includeonly{chapter/{{name}}}\input{book}"

# Extract Julia code from tex files
pull-code:
    {{julia}} --project pull_julia_code.jl

# Run tests on all juliatest blocks
test: pull-code
    {{julia}} --project runtests.jl

# Ensure the venv exists (called as a dependency)
_ensure-venv:
    test -d .venv || uv venv --python 3.13

# Remove generated files (keeps book.pdf)
clean:
    rm -f book.aux book.bbl book.bcf book.blg book.idx book.ilg book.ind
    rm -f book.log book.out book.pytxcode book.run.xml book.toc book.xwm
    rm -f all_juliaconsole_blocks.jl all_algorithm_blocks.jl all_test_blocks.jl
    rm -rf pythontex-files-book _minted-book
