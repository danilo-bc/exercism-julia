function getFactors(N)
    if N <= 0
        throw(DomainError(N, "Number not natural"))
    end

    # Starting this Array with 0 to attend edge case, doesn't affect sum
    factors = [0]
    for i = N-1:-1:1
        if N % i == 0
            push!(factors, i)
        end
    end
    return factors
end

function isperfect(N)
    factors = getFactors(N)
    if sum(factors) == N
        return true
    else
        return false
    end
end

function isabundant(N)
    factors = getFactors(N)
    if sum(factors) > N
        return true
    else
        return false
    end
end

function isdeficient(N)
    factors = getFactors(N)
    if sum(factors) < N
        return true
    else
        return false
    end
end