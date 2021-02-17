"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    NucleotideCount = Dict{Char, Int}('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for TestCharacter in strand
        if haskey(NucleotideCount, TestCharacter)
            NucleotideCount[TestCharacter] += 1
        else
            throw(DomainError(TestCharacter))
        end
    end
    return NucleotideCount
end
