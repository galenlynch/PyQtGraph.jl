# PyQtGraph [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://galenlynch.github.io/PyQtGraph.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://galenlynch.github.io/PyQtGraph.jl/dev/) [![Build Status](https://github.com/galenlynch/PyQtGraph.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/galenlynch/PyQtGraph.jl/actions/workflows/CI.yml?query=branch%3Amain) [![Coverage](https://codecov.io/gh/galenlynch/PyQtGraph.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/galenlynch/PyQtGraph.jl)

Julia wrapper of PyQtGraph Python library

A basic demonstrating example:

```julia
using PyQtGraph
app = QtApp()
(win, p1) = subplot_grid()
p1 = subplot_grid(win)[1]
(win, (p1, p2)) = subplot_grid([1, 2])

link_x_dims([p1, p2])

(win, (p1, p2)) = linked_subplot_grid([1, 2])
app(win)
```

## Citing

See [`CITATION.bib`](CITATION.bib) for the relevant reference(s).
