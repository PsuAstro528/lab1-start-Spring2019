using Test

@testset "Testing solution to Exercise 1" begin

@testset "Testing that variables exist" begin 
   @test isdefined(Main,:student_name)  # Main refers to the Main namespace, i.e. where 
   @test isdefined(Main,:student_dept)  # variables go by default if they're not in a module.
   @test isdefined(Main,:student_year)  # Most packages have
end;

@testset "Test value of student_name is not obviously wrong" begin
   @test typeof(student_name) == String   
   @test length(student_name) > 3
   @test occursin(' ',student_name)
   @test student_name != instructor
end;

@testset "Test value of student_dept is not obviously wrong" begin
   @test typeof(student_dept) == String
   @test length(student_dept) >= 3
end;

@testset "Test value of student_year is not obviously wrong" begin
   @test typeof(student_year) <: Number   
   @test typeof(student_year) <: Integer   
   @test 1 <= student_year <= 10
end;

end; # Exercise 1

