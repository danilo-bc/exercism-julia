# Implement number base conversion

function all_your_base(digits, base_in, base_out)
    if base_in < 2
        throw(DomainError(base_in, "Invalid base_in"))
    elseif base_out < 2
        throw(DomainError(base_out,"Invalid base_out"))
    elseif !all(d -> d in 0:(base_in-1), digits)
        throw(DomainError(digits,"Invalid digits present"))
    end
    # Construct number in decimal
    partial = 0
    for i = length(digits):-1:1
        partial += digits[end-i+1] * base_in^(i-1)
    end

    # Keep dividing to find the powers of base_out
    output = Array{Int}(undef,0)
    while partial > 0
        push!(output, partial % base_out)
        partial = partial ÷ base_out
    end
    if isempty(output)
        return [0]
    else
        return reverse!(output)
    end
end
