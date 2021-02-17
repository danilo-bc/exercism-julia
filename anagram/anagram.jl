function detect_anagrams(subject, candidates)
    # Filter candidates which have the same size as subject
    candidates = candidates[length(subject) .== length.(candidates)]
    
    # Filter out the same word written with different letter casing
    candidates = candidates[lowercase.(candidates) .!= lowercase(subject)]
    
    # Count number of repetitions of each letter on subject
    refCount = Dict(letter => count(==(letter), lowercase(subject)) for letter in lowercase(subject))

    # Count for each word and check with reference count
    result = []
    for word in candidates
        letterCount = Dict(letter => count(==(letter), lowercase(word)) for letter in lowercase(word))
        if refCount == letterCount
            push!(result, word)
        end
    end

    return result
end
