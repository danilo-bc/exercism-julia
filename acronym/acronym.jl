function acronym(phrase)
    words = split(phrase, (' ','_',',','.','-'))
    acronym = ""
    for word in words
        for c in word
            if isletter(c)
                acronym *= c
                break
            end
        end
    end
    
    return uppercase(acronym)
end
