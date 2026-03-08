# Tufte Algorithms Book Template

[![pipeline status](https://gitlab.com/johnnychen94/tufte_algorithms_book/badges/master/pipeline.svg)](https://gitlab.com/johnnychen94/tufte_algorithms_book/commits/master)

This book template provides a starting point upon which authors may freely build to generate their own textbook entirely in LaTeX.
We used this setup for Algorithms for Optimization, and have continued to refine it for a new textbook on decision making under uncertainty.
The template allows for the direct compilation of a print-ready PDF, including support for figures, examples, and exercises.

We do all of our development in Ubuntu.

## Prerequisites

Install [juliaup](https://github.com/JuliaLang/juliaup#installation) and then install Julia 1.10 (required by Weave.jl):
```sh
curl -fsSL https://install.julialang.org | sh
juliaup add 1.10
```

Install LaTeX via texlive. We recommend [this repo](https://github.com/scottkosty/install-tl-ubuntu).

Install [uv](https://docs.astral.sh/uv/getting-started/installation/) for Python package management:
```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Install [just](https://just.systems/man/en/installation.html) as a command runner:
```sh
cargo install just
```
Or via Homebrew: `brew install just`

## Setup

Clone the repository:
```sh
git clone --recurse-submodules https://github.com/sisl/tufte_algorithms_book.git
```

Run setup to initialize submodules, install Julia packages, create a Python venv, and install the lexer/style:
```sh
just setup
```

Install `pdf2svg`, which is used by PGFPlots (we assume Ubuntu - other operating systems may install pdf2svg differently):
```sh
sudo apt-get install pdf2svg
```

Install [pgfplots](https://ctan.org/pkg/pgfplots).

(Note that on arch-based systems, one should use tllocalmgr instead.)

## Usage

Build the full book:
```sh
just compile
```

Build a single chapter (pass the name without `chapter/` prefix or `.tex` extension):
```sh
just chapter introduction
```

Run tests on all `juliatest` blocks:
```sh
just test
```

Clean generated files (keeps `book.pdf`):
```sh
just clean
```

## Compilation Details

* `just compile` runs the full pipeline: extract Julia code, lualatex, pythontex, biber, lualatex
* `just chapter <name>` uses `\includeonly` to compile only the specified chapter
* `just test` pulls all the code and then runs all tests in `juliatest` blocks. See `runtests.jl` for details.

If you host your project under GitLab, `.gitlab-ci.yml` is a CI/CD template to start with.
