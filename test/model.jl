@testset "optimizehook" begin
    m = Model()
    @test m.optimizehook === nothing
    called = false
    function hook(m)
        called = true
    end
    JuMP.setoptimizehook(m, hook)
    @test !called
    optimize(m)
    @test called
end
@testset "UniversalFallback" begin
    m = Model()
    MOI.set!(m, MOIT.UnknownModelAttribute(), 1)
    @test MOI.get(m, MOIT.UnknownModelAttribute()) == 1
end
