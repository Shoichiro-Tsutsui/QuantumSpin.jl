"""
    pbc(index::Int, N)

Convert the site index to one that is consistent to the periodic boundary condition.

# Examples
```julia-repl
julia> pbc(0, 3)
3

julia> pbc(1, 3)
1

julia> pbc(2, 3)
2

julia> pbc(3, 3)
3

julia> pbc(4, 3)
1
```
"""
function pbc(index::Int, N)
    i = index % N
    i > 0 ? i : i+N
end

"""
    pbc(indeces::Vector{Int}, N)

Convert the site index to one that is consistent to the periodic boundary condition.

# Examples
```julia-repl
julia> pbc([0, 1, 2, 3, 4], 3)
[3, 1, 2, 3, 1]
```
"""
function pbc(indeces::Vector{Int}, N)
    [pbc(i, N) for i in indeces]
end

"""
    pbc(indeces::UnitRange{Int}, N)

Convert the site index to one that is consistent to the periodic boundary condition.

# Examples
```julia-repl
julia> pbc(-7:7, 3)
[2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
```
"""
function pbc(indeces::UnitRange{Int}, N)
    [pbc(i, N) for i in indeces]
end
