# Tufte Algorithms Book Template

This book template provides a starting point upon which authors may freely build to generate their own textbook entirely in LaTeX.
We used this setup for Algorithms for Optimization, and have continued to refine it for a new textbook on decision making under uncertainty.
The template allows for the direct compilation of a print-ready PDF, including support for figures, examples, and exercises.

We do all of our development in Ubuntu.


Install [Julia](https://julialang.org/downloads/platform.html).

Install LaTeX via texlive. We recommend [this repo](https://github.com/scottkosty/install-tl-ubuntu).

Clone the repository to a location of your choosing:
```
git clone https://github.com/sisl/tufte_algorithms_book.git
```

Initialize and update the submodules:
```
git submodule init
git submodule update
```

Compile the style:
```
cd style
sudo python setup.py install
cd ..
```

Compile the lexer:
```
cd lexer
sudo python setup.py install
cd ..
```

Install the required Julia packages:
```julia
julia install_pkgs.jl REQUIRE
```

Install `pdf2svg`, which is used by PGFPlots (we assume Ubuntu - other operating systems may install pdf2svg differently):
```
sudo apt-get install pdf2svg
```

Install [pgfplots](https://ctan.org/pkg/pgfplots).

We require pythontex 0.17, which has not been officially tagged at the time of this writing.
Download the latest version of pythontex available from master at https://github.com/gpoore/pythontex.
Install it over the version of pythontex that was just installed.

(Note that on arch-based systems, one should use tllocalmgr instead.)

## Test

Running `make test` pulls all the code and then runs all tests in `juliatest` blocks. See `runtests.jl` for details.

## Compilation

* `make compile` compiles the whole book
* `make clean` removes all generated files except `book.pdf`

If you host your project under Gitlab, `.gitlab-ci.yml` is a CI/CD template to start with.

