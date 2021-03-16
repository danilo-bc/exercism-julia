function trinary_to_decimal(str)
    for c in str
        if !isdigit(c)
            return 0
        end
    end

    trits = reverse!([parse(Int,k) for k in [str...]])
    
    if unique(trits) ⊆ Set([0,1,2])
        return sum(trits[i]*3^(i-1) for i = 1:length(str))
    else
        return 0
    end
end
