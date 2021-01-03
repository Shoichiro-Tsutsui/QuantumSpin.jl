"""
    set_spins(N, siteindeces, σs)

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
function set_spins(N, siteindeces, σs)
    siteindeces = pbc(siteindeces, N)
    list_mats = fill(σ⁰, N)
    for (i, σ) in zip(siteindeces, σs)
            list_mats[i] = σ
    end
    return list_mats
end
