# Vector to memoize the problem.
const known_values = Array{BigInt, 1}(undef, 64)

"""Checks is input value is valid"""
function validate(square)
    (square < 1 || square > 64) && throw(DomainError("Square number should be between 1 and 64"))
end

"""Calculate the number of grains on square `square`."""
function on_square(square)
    validate(square)
    if isdefined(known_values, square)
        return known_values[square]
    else
        known_values[square] = 2^(BigInt(square)-1)
        return known_values[square]
    end
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    validate(square)
    res = BigInt()
    for i in 1:square
        if isdefined(known_values, i)
            res += known_values[i]
        else
            known_values[i] = on_square(i)
            res += known_values[i]
        end
    end
    return res
end
