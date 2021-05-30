import Base: isempty, size, IndexStyle, getindex, ==, push!, intersect!

struct CustomSet{T} <: AbstractVector{T}
    contents::Vector{T}
end

function isempty(cs::CustomSet) 
    return isempty(cs.contents)
end

size(cs::CustomSet) = size(cs.contents)
IndexStyle(::Type{<:CustomSet}) = IndexLinear()
getindex(cs::CustomSet, i::Int) = cs.contents[i]

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

