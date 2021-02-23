function encode(input)
    # Remove invalid characters
    input = filter(c -> isdigit(c) || isletter(c), input)

    # Create cipher dictionary
    # Additionally, add '0':'9' to it 
    # This is not necessary, but prevents if/else inside loop
    # No strong reasons to pick either choice.
    cipher_dict = Dict('a':'z' .=> 'z':-1:'a')
    merge!(cipher_dict, Dict('0':'9' .=> '0':'9'))

    # Create an array of characters to preallocate the necessary space
    # This is better than out = "" followed by out *= something,
    # because the concatenation operator will allways allocate a new string
    out = Array{Char,1}(undef, length(input)+length(input)÷5)
    out_index = 1

    # Iterate through the phrase
    for i in 1:length(input)
        # Put the converted lowercase character into the output array 
        out[out_index] = cipher_dict[lowercase(input[i])]
        # If 5 letters have been evaluated, add a space and skip this index
        if(i % 5 == 0)
            out_index += 1
            out[out_index] = ' '
        end
        out_index += 1
    end

    # Hacky solution.
    # For special situations, the "out" array will create an additional 
    # trailing white space. This fixes the resulting string.
    # It may be prevented during earlier processing, but adds more tests
    # and probably a little less automation just to take this exception into consideration
    if out[end] == ' '
        return join(out[1:end-1])
    else
        return join(out)
    end
end

function decode(input)
    # Same logic as before but with the reverse cipher.
    # Whitespaces are ignored since we don't know word boundaries
    input = filter(c -> isdigit(c) || isletter(c), input)

    decode_dict = Dict('z':-1:'a' .=> 'a':'z')
    merge!(decode_dict, Dict('0':'9' .=> '0':'9'))

    out = Array{Char,1}(undef, length(input))

    for i in 1:length(input)
        out[i] = decode_dict[input[i]]
    end
    
    return join(out)
end

