function sieve(limit)
    test_range = collect(2:limit)
    test_marks = zeros(Bool,limit-1)

    primes = []
    for i in test_range
        if test_marks[i-1] == 0
            push!(primes, i)
        end
        for k in test_range[(i:i:limit).-1]
            test_marks[k-1] = 1
        end
    end

    return primes
end
