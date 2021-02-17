"Your optional docstring here"
function distance(a, b)
    if length(a) ≠ length(b)
        throw(ArgumentError("Argument lengths should be equal"))
    else
        distance = 0
        for i = 1:length(a)
            if a[i] ≠ b[i]
                distance += 1
            end
        end
        return distance

    end
end
