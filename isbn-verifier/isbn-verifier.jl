abstract type ISBN <: AbstractString end

function isvalid(T::Type{ISBN}, code::String)
    if length(code) < 10
        return false
    elseif code[end] == 'X'
        last_digit = 10
    elseif isnumeric(code[end])
        last_digit = parse(Int, code[end])
    else
        return false
    end

    code = filter(x->x=='X'||isnumeric(x), code)
    if length(code) != 10
        return false
    end
    for ch in code[1:end-1]
        if !isnumeric(ch)
            return false
        end
    end
    d = digits(parse(Int, code[1:end-1]))
    reverse!(d)
    

    return (d[1] * 10 + d[2] * 9 + d[3] * 8 + d[4] * 7 + d[5] * 6 + d[6] * 5 + d[7] * 4 + d[8] * 3 + d[9] * 2 + last_digit * 1) % 11 == 0

end