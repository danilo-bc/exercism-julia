function transform(input::AbstractDict)
    output = Dict{Char, Int64}()

    for k in keys(input)
        for v in input[k]
            output[lowercase(v)] = k
        end
    end

    return output
end

