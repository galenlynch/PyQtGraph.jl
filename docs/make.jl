using PyQtGraph
using Documenter

DocMeta.setdocmeta!(PyQtGraph, :DocTestSetup, :(using PyQtGraph); recursive=true)

makedocs(;
    modules=[PyQtGraph],
    authors="Galen Lynch <galen@galenlynch.com>",
    sitename="PyQtGraph.jl",
    format=Documenter.HTML(;
        canonical="https://galenlynch.github.io/PyQtGraph.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/galenlynch/PyQtGraph.jl",
    devbranch="main",
)
