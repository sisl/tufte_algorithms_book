using Test

include("pull_julia_code.jl")

println("="^20)
println("Importing support code!")
include("support_code.jl")

println("="^20)
println("Running tests!")
include("all_test_blocks.jl")

println("ALL TESTS PASSED")