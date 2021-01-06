@testset "lattice" begin
    @test_throws AssertionError lattice(:chain, 0)

    @test lattice(:chain, 1) == [0]

    @test lattice(:chain, 2) == [0 2
                                 2 0]
#
    @test lattice(:chain, 2, ispbc=false) == [
                                            0 1
                                            1 0]

    @test lattice(:chain, 3) == [0 1 1
                                 1 0 1
                                 1 1 0]

    @test lattice(:chain, 3, ispbc=false) == [
                                            0 1 0
                                            1 0 1
                                            0 1 0
                                            ]
#
    @test_throws DomainError issquare(-1)
    @test issquare(0)
    @test issquare(1)
    @test !issquare(2)
    @test !issquare(3)
    @test issquare(4)
    @test issquare(9)

    @test_throws AssertionError lattice(:square, 0)
    @test_throws AssertionError lattice(:square, 3)

    @test lattice(:square, 1) == [0]

    @test lattice(:square, 4) == [
                                0 2 2 0
                                2 0 0 2
                                2 0 0 2
                                0 2 2 0
                                ]
#
    @test lattice(:square, 4, ispbc=false) == [
                                0 1 1 0
                                1 0 0 1
                                1 0 0 1
                                0 1 1 0
                                ]

    @test lattice(:square, 9) == [
                                0 1 1 1 0 0 1 0 0
                                1 0 1 0 1 0 0 1 0
                                1 1 0 0 0 1 0 0 1
                                1 0 0 0 1 1 1 0 0
                                0 1 0 1 0 1 0 1 0
                                0 0 1 1 1 0 0 0 1
                                1 0 0 1 0 0 0 1 1
                                0 1 0 0 1 0 1 0 1
                                0 0 1 0 0 1 1 1 0
                                ]
#
    @test lattice(:square, 9, ispbc=false) == [
                                0 1 0 1 0 0 0 0 0
                                1 0 1 0 1 0 0 0 0
                                0 1 0 0 0 1 0 0 0
                                1 0 0 0 1 0 1 0 0
                                0 1 0 1 0 1 0 1 0
                                0 0 1 0 1 0 0 0 1
                                0 0 0 1 0 0 0 1 0
                                0 0 0 0 1 0 1 0 1
                                0 0 0 0 0 1 0 1 0
                                ]

end
