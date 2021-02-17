# Rotate a single character
function rotate(key, c::Char)
    if c in 'a':'z'
        return 'a' + (Int(c - 'a') + key) % 26
    elseif c in 'A':'Z'
        return 'A' + (Int(c - 'A') + key) % 26
    else
        return c
    end
end

# Rotate a string
function rotate(key, phrase::String)
    out_phrase = Array{Char, 1}(undef, length(phrase))
    for i in 1:length(phrase)
        out_phrase[i] = rotate(key, phrase[i])
    end
    return join(out_phrase)
end

# Bonus A
macro R13_str(phrase)
    return rotate(13, phrase)
end

# Bonus B
for i in 1:26
    macro_name = Symbol("R$(i)_str")
    @eval begin
        macro $macro_name(phrase)
            return rotate($i, phrase)
        end
    end

end