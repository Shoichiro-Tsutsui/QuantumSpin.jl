"""
    set_spins(N, siteindeces::Vector{Int}, σs)

Return a list of Pauli matrices.

# Examples
```julia-repl
julia> set_spins(3, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰]
true

julia> set_spins(4, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰, σ⁰]
true

julia> set_spins(4, [2, 3], [σᶻ, σˣ]) == [σ⁰, σᶻ, σˣ, σ⁰]
true
```
"""
function set_spins(N, siteindeces::Vector{Int}, σs)
    siteindeces = pbc(siteindeces, N)
    list_mats = fill(σ⁰, N)
    for (i, σ) in zip(siteindeces, σs)
            list_mats[i] = σ
    end
    return list_mats
end

"""
    set_spins(N, siteindeces::CartesianIndex, σs)

Return a list of Pauli matrices, where siteindeces is the row and column number
of an adjacency matrix.

# Examples
```julia-repl
julia> set_spins(4, CartesianIndex(2, 3), [σᶻ, σˣ]) == [σ⁰, σᶻ, σˣ, σ⁰]
true
```
"""
function set_spins(N, siteindeces::CartesianIndex, σs)
    @assert length(siteindeces) == 2 "len(siteindeces) must be 2."
    @assert length(σs) == 2 "len(σs) must be 2."
    list_mats = fill(σ⁰, N)
    list_mats[siteindeces[1]] = σs[1]
    list_mats[siteindeces[2]] = σs[2]
    return list_mats
end
