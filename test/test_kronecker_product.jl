@testset "Kronecker product" begin
    A = [1 0; 0 1]
    B = [1 0; 0 -1]
    C = [1 0 0 0; 0 -1 0 0; 0 0 1 0; 0 0 0 -1]
    @test A⊗B == C
    @test ⊗(A,A,B,B) == A⊗A⊗B⊗B
end
