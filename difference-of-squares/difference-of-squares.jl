"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    # From calculus/algebra, a fomula for 
    # a triangular number
    return ((1 + n) * ( n ))^2 ÷ 4
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    # Using square pyramidal numbers formula (1^2+2^2+...+n^2)
    return (n* (n+1) * (2*n+1)) ÷ 6
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return square_of_sum(n) - sum_of_squares(n)
end
