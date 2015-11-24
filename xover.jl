#!/usr/bin/env julia

push!(LOAD_PATH, pwd() )
import julieo

# Mutate and compute time
function time_xover(number)
    inicioTiempo = time()

    indi1 =  julieo.random_chromosome(length)
    indi2 =  julieo.random_chromosome(length)
    for i in 0:1:number
        (indi1,indi2) = julieo.crossover(indi1,indi2)
    end
    time()-inicioTiempo
end

length = 16
iterations = 100000
top_length = 32768

while length <= top_length
  println("julia-Xover, " * string(length) * ", " * string(time_xover( iterations )))
  length = length*2
end
