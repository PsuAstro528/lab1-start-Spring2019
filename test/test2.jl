using Test
@testset "Testing solution to Exercise 2" begin

@testset "Testing that the expected functions exist." begin 
   @test isdefined(Main,:var_one_pass)
   @test isdefined(Main,:var_two_pass)
   @test isdefined(Main,:var_online)
end;

@testset "Test that the values are close for a test dataset with N=10." begin
   jan1_2019 = 2458484.500000  # Julian Date for Jan 1, 2019
   y_test = generate_sample(10, jan1_2019)
   @test isapprox(var(y_test),var_one_pass(y_test),rtol=1e-3) 
   @test !isapprox(var(y_test),var_one_pass(y_test),rtol=1e-4) 
   @test isapprox(var(y_test),var_two_pass(y_test),rtol=1e-5) 
   @test isapprox(var(y_test),var_online(y_test),rtol=1e-5) 
   @test !isapprox(var(y_test),var_online(y_test),rtol=1e-11) 
end;

@testset "Test that the values are close for a test dataset with N=10^4" begin
   y_test = generate_sample(10^4, jan1_2019)
   @test isapprox(var(y_test),var_one_pass(y_test),rtol=1e-1) 
   @test !isapprox(var(y_test),var_one_pass(y_test),rtol=1e-2) 
   @test isapprox(var(y_test),var_two_pass(y_test),rtol=1e-3) 
   @test isapprox(var(y_test),var_online(y_test),rtol=1e-9) 
   @test !isapprox(var(y_test),var_online(y_test),rtol=1e-11) 
end;

@testset "Test that the values are close for a test dataset with N=10^6" begin
   y_test = generate_sample(10^6, jan1_2019)
   @test isapprox(var(y_test),var_one_pass(y_test),rtol=0.6) 
   @test !isapprox(var(y_test),var_one_pass(y_test),rtol=0.1) 
   @test isapprox(var(y_test),var_two_pass(y_test),rtol=1e-3) 
   @test isapprox(var(y_test),var_online(y_test),rtol=1e-9)    
   @test !isapprox(var(y_test),var_online(y_test),rtol=1e-11)    
end;

end; # Exercise 2

