function bob(stimulus)
    NDigits = 0
    NLower = 0
    NUpper = 0

    for c in stimulus
        if isdigit(c)
            NDigits += 1
        elseif islowercase(c)
            NLower += 1
        elseif isuppercase(c)
            NUpper += 1
        else
            continue
        end
    end
    stimulus = strip(stimulus)
    if length(stimulus) == 0
        return "Fine. Be that way!"
    else 
        if stimulus[end] == '?'
            if NLower == 0 && NUpper ≥ 1
                return "Calm down, I know what I'm doing!"
            else
                return "Sure."
            end
        else
            if NLower == 0 && NUpper ≥ 1
                return "Whoa, chill out!"
            else
                return "Whatever."
            end
        end
    end
end
