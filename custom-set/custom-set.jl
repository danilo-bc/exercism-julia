import Base: isempty, size, length, IndexStyle, getindex, iterate, copy, ==, push!, intersect!, union!, union
# Observation:
# while this implementation passes all functional tests,
# there's no guarantee of performance in any test!
# Notice how no hash is calculated and how equality
# operations require a sort.
# At this point, code can be refactored as necessary,
# always running all tests in each step
mutable struct CustomSet{T} <: AbstractSet{T}
    contents::Vector{T}
end

function isempty(cs::CustomSet) 
    return isempty(cs.contents)
end

size(cs::CustomSet) = size(cs.contents)
length(cs::CustomSet) = length(cs.contents)
IndexStyle(::Type{<:CustomSet}) = IndexLinear()
getindex(cs::CustomSet, i::Int) = cs.contents[i]

iterate(cs::CustomSet) = iterate(cs.contents)
iterate(cs::CustomSet, state::Int) = iterate(cs.contents, state)

copy(cs::CustomSet) = CustomSet(copy(cs.contents))

function disjoint(cs1::CustomSet, cs2::CustomSet)
    for item in cs1
        if item in cs2
            return false
        end
    end
    return true
end

==(cs1::CustomSet, cs2::CustomSet) = sort(cs1.contents) == sort(cs2.contents)

function push!(cs::CustomSet, item)
    if !(item in cs)
        push!(cs.contents, item)
    end
    return cs
end

function intersect!(cs1::CustomSet, cs2::CustomSet)
    intersect!(cs1.contents, cs2.contents)
    return cs1
end

function complement(cs1::CustomSet, cs2::CustomSet)
    complement_vec = Vector{eltype(cs1.contents)}(undef, 0)
    for item in cs1
        if !(item in cs2)
            push!(complement_vec, item)
        end
    end
    return CustomSet(complement_vec)
end

function complement!(cs1::CustomSet, cs2::CustomSet)
    complement_vec = Vector{eltype(cs1.contents)}(undef, 0)
    for item in cs1
        if !(item in cs2)
            push!(complement_vec, item)
        end
    end
    cs1.contents = complement_vec
end

union!(cs1::CustomSet, cs2::CustomSet) = union!(cs1.contents, cs2.contents)
union(cs1::CustomSet, cs2::CustomSet) = CustomSet(union(cs1.contents, cs2.contents))
