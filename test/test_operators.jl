@testset "operators" begin
    ### longitudinal magnetic field
    @test on_site_term(zeros(2), σᶻ) == spzeros(4, 4)

    @test on_site_term([0,1], σᶻ) == sparse(Diagonal([1,-1,1,-1]))
    @test on_site_term([1,0], σᶻ) == sparse(Diagonal([1,1,-1,-1]))
    @test on_site_term(ones(2), σᶻ) == sparse(Diagonal([2,0,0,-2]))

    @test on_site_term([2,0], σᶻ) == sparse(Diagonal([2,2,-2,-2]))
    @test on_site_term([2.1,0], σᶻ) == sparse(Diagonal([2.1,2.1,-2.1,-2.1]))


    ### spin-spin interaction term
    # sanity check
    @test spin_spin_interaction_term(zeros(2,2), σᶻ) == spzeros(4, 4)

    A = [
        0 1 0
        1 0 0
        0 0 0
        ]
    @test spin_spin_interaction_term(A, σᶻ) == sparse(Diagonal([1,1,-1,-1,-1,-1,1,1]))

    A = [
        0 2 0
        2 0 0
        0 0 0
        ]
    @test spin_spin_interaction_term(A, σᶻ) == sparse(Diagonal([2,2,-2,-2,-2,-2,2,2]))

    # 1d Ising model wiht the periodic boundary condition
    A = [
        0 1 1
        1 0 1
        1 1 0
        ]
    Ising1d = sparse(Diagonal([3,-1,-1,-1,-1,-1,-1,3]))
    @test spin_spin_interaction_term(A, σᶻ) == Ising1d
    @test spin_spin_interaction_term(sparse(A), σᶻ) == Ising1d

    # 2d Ising model
    A = [
     0  1  1  0
     1  0  0  1
     1  0  0  1
     0  1  1  0
    ]
    Ising2d = Diagonal([1,-1,-1,1, 1,-1,-1,1, 1,-1,-1,1, 1,-1,-1,1])
    Ising2d += Diagonal([1,1,1,1, -1,-1,-1,-1, -1,-1,-1,-1, 1,1,1,1])
    Ising2d += Diagonal([1,-1,1,-1, -1,1,-1,1, 1,-1,1,-1, -1,1,-1,1])
    Ising2d += Diagonal([1,1,-1,-1, 1,1,-1,-1, -1,-1,1,1, -1,-1,1,1])
    @test spin_spin_interaction_term(A, σᶻ) == sparse(Ising2d)
    @test spin_spin_interaction_term(A, σᶻ) == hamiltonian(zeros(4,4), zeros(4,4), A, zeros(4), zeros(4), zeros(4))

    # Assertion
    A = [
     0  1  1  0
     1  0  0  1
     1  0  0  1
     1  1  1  0
    ]
    @test_throws AssertionError spin_spin_interaction_term(A, σᶻ)
end
