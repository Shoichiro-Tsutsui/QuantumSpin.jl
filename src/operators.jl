using LinearAlgebra
using QuantumSpin

@doc raw"""
    spin_spin_interaction_term(A, σ)

Compute a spin-spin interaction term:

``\sum_{i} h_{i} \sigma_i^\alpha,

where ``h_{i}`` is a vector and ``\alpha = x,y,z``.
"""
function on_site_term(h, σ)
    N = length(h)
    Res = spzeros(2^N, 2^N)
    for index in findall(!iszero, h)
        Res += ⊗(set_spins(N, index, σ)...) * h[index]
    end
    Res
end


@doc raw"""
    spin_spin_interaction_term(A, σ)

Compute a spin-spin interaction term:

``\sum_{i>j} A_{ij} \sigma_i^\alpha \sigma_j^\alpha``,

where ``A_{ij}`` is an adjacency matrix and ``\alpha = x,y,z``.
"""
function spin_spin_interaction_term(A, σ)
    @assert issymmetric(A) "The adjacency matrix must be symmetric."
    N = size(A)[1]
    Res = spzeros(2^N, 2^N)
    for indeces in findall(!iszero, tril(A))
        Res += ⊗(set_spins(N, indeces, [σ, σ])...) *A[indeces]
    end
    Res
end
