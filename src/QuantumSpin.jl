module QuantumSpin

    export σ⁰, σˣ, σʸ, σᶻ
    include("pauli_matrices.jl")

    export ⊗
    include("kronecker_product.jl")

    export pbc
    include("pbc.jl")

    export lattice
    export issquare
    include("lattice.jl")

    export set_spins
    include("set_spins.jl")

    export on_site_term
    export spin_spin_interaction_term
    export hamiltonian
    include("operators.jl")
end
