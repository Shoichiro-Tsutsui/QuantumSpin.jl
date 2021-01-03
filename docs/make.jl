using QuantumSpin
using Documenter

makedocs(;
    modules=[QuantumSpin],
    authors="tsutsui <shoppa99.nanone@hotmail.co.jp> and contributors",
    repo="https://github.com/Shoichiro-Tsutsui/QuantumSpin.jl/blob/{commit}{path}#L{line}",
    sitename="QuantumSpin.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Shoichiro-Tsutsui.github.io/QuantumSpin.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Shoichiro-Tsutsui/QuantumSpin.jl",
    devbranch = "main"
)
