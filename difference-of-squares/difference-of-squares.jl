"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    # From calculus/algebra, a fomula for 
    # a triangular number
    return Int(((1 + n) * ( n/2 ))^2)
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    # Simply broadcast ^2 to the range and apply sum
    return Int(sum((1:n).^2))
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return square_of_sum(n) - sum_of_squares(n)
end
