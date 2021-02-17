function to_rna(dna)
    transcriptionDict = Dict('A' => 'U', 'C' => 'G', 'G' => 'C', 'T' => 'A')
    seq = ""
    for testChar in dna
        if testChar ∉ "ACGT"
            throw(ErrorException("Invalid base found"))
        else
            seq *= transcriptionDict[testChar]
        end
    end
    return seq
end

