using LinearAlgebra

"""
    lattice(s, N, ispbc=true)

Create a adjacency matrix of lattice `s` with size ``N``.
The periodic boundary condition is imposed by default.
Admissible values for `s` are:

| `s`                      | graph type                       |
| :------------------------|:---------------------------------|
| :chain                   | A one dimensional chain.         |
| :square                  | A two dimensional square lattice.|

# Examples
```julia-repl
julia> lattice(:chain, 3)
[0 1 1
 1 0 1
 1 1 0]

julia> lattice(:square, 4, ispbc=false)
[0 1 1 0
 1 0 0 1
 1 0 0 1
 0 1 1 0]
```
"""
function lattice(s::Symbol, N::Int; ispbc=true)
    graphmap = Dict(
        :chain => chain_graph,
        :square => square_graph,
    )

    if (s in keys(graphmap))
        return graphmap[s](N, ispbc)
    end
    throw(ArgumentError("$s is not a valid graph"))
end


"""
    chain_graph(N, ispbc)

An adjacency matrix of a chain graph with length ``N``.

# Examples
```julia-repl
julia> chain_graph(3)
[0 1 1
 1 0 1
 1 1 0]
```
"""
function chain_graph(N, ispbc)
    @assert N > 0 "N must be larger than 1."
    if N == 1
        return [0]
    end
    A = Matrix(SymTridiagonal(zeros(Int, N), ones(Int, N-1)))
    if ispbc
        A[1, N] += 1
        A[N, 1] += 1
    end
    A
end


"""
    issquare(N)

Check whether the number is perfect square or not.

# Examples
```julia-repl
julia> issquare(2)
false

julia> issquare(4)
true
```
"""
function issquare(N)
    isqrt(N)^2 == N
end


"""
    square_graph(N, ispbc)

An adjacency matrix of a square lattice whose number of vertices is ``N``.

# Examples
```julia-repl
julia> square_graph(4)
[0 2 2 0
 2 0 0 2
 2 0 0 2
 0 2 2 0]

julia> square_graph(4, ispbc=false)
[0 1 1 0
 1 0 0 1
 1 0 0 1
 0 1 1 0]
```
"""
function square_graph(N, ispbc)
    @assert N > 0 "N must be larger than 1."
    @assert issquare(N) "N must be a perfect square number."
    L = isqrt(N)
    if N == 1
        return [0]
    end

    A = transpose(reshape(1:N, L,L))
    h = [(A[CartesianIndex(i,j)], A[CartesianIndex(i,pbc(j+1,L))]) for i in 1:L for j in 1:L]
    v = [(A[CartesianIndex(i,j)], A[CartesianIndex(pbc(i+1,L),j)]) for i in 1:L for j in 1:L]
    bonds = vcat(v, h)

    h = [(A[CartesianIndex(i,1)], A[CartesianIndex(i,L)]) for i in 1:L]
    v = [(A[CartesianIndex(1,j)], A[CartesianIndex(L,j)]) for j in 1:L]
    pbcbonds = vcat(v, h)

    Res = zeros(Int, N, N)
    for b in bonds
        Res[b[1], b[2]] += 1
        Res[b[2], b[1]] += 1
    end
    if !ispbc
        for b in pbcbonds
            Res[b[1], b[2]] -= 1
            Res[b[2], b[1]] -= 1
        end
    end
    Res
end
