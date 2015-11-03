#!/usr/bin/env julia

# Create a random chromosome
function random_chromosome(length)
  srand(time_ns())
  chromosome = Int8[]

  for i in 1:1:length
      push!(chromosome,rand(0:1))
  end
  chromosome
end


# Computes maxOnes fitness
function compute_fitness(chromosome)
  ones = 0
  for i in chromosome
    ones += i
  end
  ones
end


# Mutate all chromosomes in the population
function mutate1(chromosome)
  srand(time_ns())

  mutation_point = rand(1:length(chromosome))
  println(mutation_point)
  println(length(chromosome))
  temp = chromosome
  mutie = temp[1:mutation_point-1]

  b = temp[mutation_point] == 1 ? 0 : 1
  push!(mutie,b)
  append!(mutie,temp[mutation_point+1:length(temp)])
  mutie
end


# Mutate all chromosomes in the population
function mutate(pool)
  for i in pool
    i = mutate1(pool)
  end
  pool
end


# Crossover
function crossover(chrom1, chrom2)
  srand(time_ns())

  len = length(chrom1)
  xover_point = floor(rand(1:len-1))
  range = 1 + floor(rand(0:len - xover_point))

  if range+xover_point > len
    range = 1
  end

  new_chrom1 = chrom1[1:xover_point-1]
  new_chrom2 = chrom2[1:xover_point-1]
  append!(new_chrom1, chrom2[xover_point:xover_point+range])
  append!(new_chrom2, chrom1[xover_point:xover_point+range])

  if xover_point+range+1<len
    append!(new_chrom1, chrom1[xover_point+range+1:len])
    append!(new_chrom2, chrom2[xover_point+range+1:len])
  end
  
  return new_chrom1,new_chrom2
end


