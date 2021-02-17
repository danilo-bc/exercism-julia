function prime_factors(N)
    factors = []
    while N > 1
        for x = 2:N
            if N % x == 0
                N /= x
                push!(factors, x)
                break
            end
        end
    end

    return factors
end