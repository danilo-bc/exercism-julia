"""Checks is input value is valid"""
function validate(square)
    (square < 1 || square > 64) && throw(DomainError("Square number should be between 1 and 64"))
end

"""Calculate the number of grains on square `square`."""
function on_square(square)
    validate(square)
    return 2^(BigInt(square)-1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    validate(square)
    return sum(2^(k-1) for k in BigInt(1):square)
end
