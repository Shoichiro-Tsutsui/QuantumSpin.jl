@testset "Kronecker product" begin
    A = [1 0; 0 1]
    B = [1 0; 0 -1]
    C = [1 0 0 0; 0 -1 0 0; 0 0 1 0; 0 0 0 -1]
    @test A⊗B == C
    @test ⊗(A,A,B,B) == A⊗A⊗B⊗B

    A, B, C, D = rand(2, 2), rand(2, 2), rand(2, 2), rand(2, 2)
    @test A⊗(B+C) ≈ A⊗B + A⊗C
    @test (B+C)⊗A ≈ B⊗A + C⊗A
    @test (A⊗B)⊗C ≈ A⊗(B⊗C)
    @test (A⊗B)*(C⊗D) ≈ (A*C)⊗(B*D)
end
