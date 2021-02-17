function matching_brackets(expr)
    left = Set(['(', '[', '{'])
    right = Set(['}',']', ')'])

    leftStack = []
    for c in expr
        if c in left
            push!(leftStack, c)
        elseif c in right
            # This second composite test checks if left symbols
            # ( [ or { are equal to ) ] or }
            # ) is (+1 in Unicode
            # ] and } are [ and { +2 in Unicode.
            # This was made to save up 'if-else' statements for each pair
            if isempty(leftStack) || !(c == leftStack[end]+1 || c == leftStack[end]+2)
                return false
            else
                pop!(leftStack)
            end
        else
            continue
        end
    end

    if !isempty(leftStack)
        return false
    else
        return true
    end

end