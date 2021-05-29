import Base: isempty, size, IndexStyle, getindex

struct CustomSet{T} <: AbstractVector{T}
    contents::Vector{T}
end

function isempty(cs::CustomSet) 
    return isempty(cs.contents)
end

size(cs::CustomSet) = size(cs.contents)
IndexStyle(::Type{<:CustomSet}) = IndexLinear()
getindex(cs::CustomSet, i::Int) = cs.contents[i]