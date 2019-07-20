# Tufte Algorithms Book Template

This book template provides a starting point upon which authors may freely build to generate their own textbook entirely in LaTeX.
We used this setup for Algorithms for Optimization, and have continued to refine it for a new textbook on decision making under uncertainty.
The template allows for the direct compilation of a print-ready PDF, including support for figures, examples, and exercises.

We do all of our development in Ubuntu.

## Installation

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

Install the PGFPlots.jl package:
```julia
using Pkg
Pkg.add("PGFPlots")
```

Install `pdf2svg`, which is used by PGFPlots (we assume Ubuntu - other operating systems may install pdf2svg differently):
```
sudo apt-get install pdf2svg
```

Install [pgfplots](https://ctan.org/pkg/pgfplots).

Install the Weave.jl package:
```julia
using Pkg
Pkg.add("Weave")
```

We require pythontex 0.17, which has not been officially tagged at the time of this writing.
Download the latest version of pythontex available from master at https://github.com/gpoore/pythontex.
Install it over the version of pythontex that was just installed.

(Note that on arch-based systems, one should use tllocalmgr instead.)

## Compilation

The textbook can be compiled as follows:
```
julia pull_julia_code.jl
lualatex book
pythontex book
biber book
lualatex book
```
