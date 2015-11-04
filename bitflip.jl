#!/usr/bin/env julia

push!(LOAD_PATH, pwd() )
import julieo

# Mutate and compute time
function time_mutations(number, indi)
  inicioTiempo = time()

  for i in 0:1:number
    julieo.mutate1(indi)
  end
  time()-inicioTiempo

end

length = 16
iterations = 100000
top_length = 32768

while length <= top_length
  indi =  julieo.random_chromosome(length)
  println("julia-BitString, " * string(length) * ", " * string(time_mutations( iterations, indi )))
  length = length*2
end
