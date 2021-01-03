@testset "set spins" begin
    @test set_spins(3, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰]
    @test set_spins(4, [2], [σᶻ]) == [σ⁰, σᶻ, σ⁰, σ⁰]
    @test set_spins(4, [2, 3], [σᶻ, σˣ]) == [σ⁰, σᶻ, σˣ, σ⁰]
end
