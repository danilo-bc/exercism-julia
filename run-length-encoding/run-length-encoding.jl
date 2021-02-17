function encode(s)
    phrase = ""
    if !isempty(s)
        lastChar = s[1]
        count = 1
        for i = 2:length(s)
            ch = s[i]
            if ch ≠ lastChar
                if count == 1
                    phrase *= lastChar
                else
                    phrase *= string(count)
                    phrase *= lastChar
                end
                lastChar = ch
                count = 1
            else
                count += 1
            end
        end

        # Find out what to do with the last character
        if count == 1
            phrase *= lastChar
        else
            phrase *= string(count)
            phrase *= lastChar
        end
    end

    return phrase
end



function decode(s)
    phrase = ""
    count = ""
    # If it's not a digit, concatenate the appropriate number of times
    # if it is, append to the 'count' string
    for ch in s
        if !isdigit(ch)
            if isempty(count)
                phrase *= ch
            else
                phrase *= ch^parse(Int,count)
                count = ""
            end
        else
            count *= ch
        end
    end

    return phrase
end
