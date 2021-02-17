function wordcount(sentence)
    wordCountDictionary = Dict()
    if !isempty(sentence)
        # Transform into lowercase to account for word variations
        sentence = lowercase(sentence)
        # Replace non-letters with spaces
        sentence = replace(sentence, r"[^\w]" => s" ")
        # Correct separated n'ts
        sentence = replace(sentence, r"n\st" => s"n't")
        
        # Split into words
        sentence = split(sentence)

        # Count the words
        for word in sentence
            if haskey(wordCountDictionary, word)
                wordCountDictionary[word] += 1
            else
                wordCountDictionary[word] = 1
            end
        end
    end

    return wordCountDictionary

end
