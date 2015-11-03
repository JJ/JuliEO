#!/usr/bin/env julia
push!(LOAD_PATH, pwd() )
import julieo

using Base.Test

  population = []
  chromosome_length = 16
  population_size =  32

  for i in 0:1:population_size
    println(i)
    chromosome = julieo.random_chromosome(chromosome_length)
    push!(population,chromosome)
    @test length(chromosome) != 0
    @test length(chromosome) == chromosome_length
    mutated =  julieo.mutate1(chromosome)
    @test length(chromosome) == length(mutated)
    @test chromosome != mutated
  end