@testset "set spins" begin
    # Use a list of integers.
    @test set_spins(3, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰]
    @test set_spins(4, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰, σ⁰]
    @test set_spins(4, [2, 3], [σᶻ, σˣ]) == [σ⁰, σᶻ, σˣ, σ⁰]

    # Use a CartesianIndex.
    @test set_spins(4, CartesianIndex(2, 3), [σᶻ, σˣ]) == [σ⁰, σᶻ, σˣ, σ⁰]
    @test_throws AssertionError set_spins(4, CartesianIndex(2), [σᶻ, σˣ])
    @test_throws AssertionError set_spins(4, CartesianIndex(2,3), [σᶻ])
end
