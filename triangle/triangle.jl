function is_valid_triangle(sides)
    # auxiliary function to avoid repetition in others
    Verdict = true
    Verdict &= sides[1] + sides[2] > sides[3]
    Verdict &= sides[1] + sides[3] > sides[2]
    Verdict &= sides[2] + sides[3] > sides[1]
    return Verdict
end

function is_equilateral(sides)
    return is_valid_triangle(sides) && sides[1] > 0 && (length(sides) == length(sides[sides.==sides[1]])) 
end

function is_isosceles(sides)
    # Check if numbers are positive, then compare each pair
    return is_valid_triangle(sides) && all(sides .> 0) && (sides[1] == sides[2] || sides[2] == sides[3] || sides[1] == sides[3])
end

function is_scalene(sides)
    return is_valid_triangle(sides) && all(sides .> 0) && (length(unique(sides)) == 3)
end
