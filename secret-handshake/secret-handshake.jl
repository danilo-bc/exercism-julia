function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bits = digits(Bool, code, base=2, pad=5)[1:5]

    code_translated = [actions[i] for i = 1:4 if bits[i]]

    if bits[5]
        return reverse!(code_translated)
    else
        return code_translated
    end
end
