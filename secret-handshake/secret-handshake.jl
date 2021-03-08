function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bits = digits(code, base=2, pad=5)[1:5]

    code_translated = Array{String, 1}(undef,0)

    for i = 1:4
        if bits[i] == 1
            push!(code_translated, actions[i])
        end
    end

    if bits[5] == 0
        return code_translated
    else
        return code_translated[end:-1:1]
    end
end
