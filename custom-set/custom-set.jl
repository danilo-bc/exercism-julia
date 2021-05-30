import Base: isempty, size, IndexStyle, getindex, ==

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

==(cs1::CustomSet, cs2::CustomSet) = cs1.contents == sort(cs2.contents)