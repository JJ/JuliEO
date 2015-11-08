#!/usr/bin/env julia

push!(LOAD_PATH, pwd() )
import julieo

# Mutate and compute time
function time_mutations(number)
  inicioTiempo = time()

  for i in 0:1:number
    indi =  julieo.random_chromosome(length)
    julieo.compute_fitness(indi)
  end
  time()-inicioTiempo

end

length = 16
iterations = 100000
top_length = 32768

while length <= top_length

  println("julia-Onemax, " * string(length) * ", " * string(time_mutations( iterations )))
  length = length*2
end