module QuantumSpin

    export σ⁰, σˣ, σʸ, σᶻ
    include("pauli_matrices.jl")

    export ⊗
    include("kronecker_product.jl")

end
