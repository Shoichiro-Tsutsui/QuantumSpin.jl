@testset "periodic boundary condition" begin
    @test pbc(0, 3) == 3
    @test pbc(1, 3) == 1
    @test pbc(2, 3) == 2
    @test pbc(3, 3) == 3
    @test pbc(4, 3) == 1
    @test pbc([0, 1, 2, 3, 4] ,3) == [3, 1, 2, 3, 1]
    @test pbc(-7:7, 3) == [2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
end
