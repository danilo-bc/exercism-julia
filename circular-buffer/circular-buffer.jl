import Base: popfirst!
# Bonus
import Base: size, IndexStyle, getindex, setindex!, length, isempty, pushfirst!, convert, ==

mutable struct CircularBuffer{T} <: AbstractVector{T}
    buf_vec::Vector{T}
    start::Int
    finish::Int
    cb_len::Int
    cb_capacity::Int

    function CircularBuffer{T}(buffer_capacity::Integer) where {T}
        new(Vector{T}(undef, buffer_capacity), 1, 1, 0, buffer_capacity)
    end
end

function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if typeof(item) != eltype(typeof(cb.buf_vec)) throw(Exception()) end
    if (isfull(cb) && !overwrite) throw(BoundsError()) end

    if isfull(cb) && overwrite cb.start = mod(cb.start, cb.cb_capacity)+1 end
    
    cb.finish = mod(cb.finish, cb.cb_capacity)+1
    
    if (!isfull(cb)) cb.cb_len += 1 end
    cb.buf_vec[cb.finish] = item
    return cb
end

function Base.popfirst!(cb::CircularBuffer)
    if isempty(cb)
        throw(BoundsError()) 
    else
        buffer_length = cb.cb_capacity
        cb.cb_len -= 1
        cb.start = mod(cb.start, buffer_length)+1
        return cb.buf_vec[cb.start]
    end
    
end

function Base.empty!(cb::CircularBuffer)
    cb.start = cb.finish
    cb.cb_len = 0
    return cb
end

## Bonus

# These 4 are the most important
size(cb::CircularBuffer) = size(cb.buf_vec)
IndexStyle(::Type{<:CircularBuffer}) = IndexLinear()
getindex(cb::CircularBuffer, i::Int) = i <= capacity(cb) ? getindex(cb.buf_vec, mod(cb.start+i-1, cb.cb_capacity)+1) : throw(BoundsError())
setindex!(cb::CircularBuffer, v, i::Int) = i <= capacity(cb) ? setindex!(cb.buf_vec, v, mod(cb.start+i-1, cb.cb_capacity)+1) : throw(BoundsError())
# General useful utility
capacity(cb::CircularBuffer) = cb.cb_capacity
isempty(cb::CircularBuffer) = (cb.cb_len == 0)
isfull(cb::CircularBuffer) = (cb.cb_len == cb.cb_capacity)
length(cb::CircularBuffer) = cb.cb_len
first(cb::CircularBuffer) = isempty(cb) ? throw(BoundsError()) : cb.buf_vec[mod(cb.start, length(cb.buf_vec))+1]
last(cb::CircularBuffer) = isempty(cb) ? throw(BoundsError()) : cb.buf_vec[cb.finish]

append!(cb::CircularBuffer, items; overwrite=false) = for item in items push!(cb, item, overwrite=overwrite)end
convert(T::Type{Array}, cb::CircularBuffer) = convert(T, cb[1:cb.cb_len]) # This works because we set our IndexStyle earlier!
==(cb::CircularBuffer, A::AbstractVector) = cb[1:cb.cb_len] == A

function pushfirst!(cb::CircularBuffer, item; overwrite=false)
    if (typeof(item) != eltype(typeof(cb.buf_vec))) throw(Exception()) end
    if (isfull(cb) && !overwrite) throw(BoundsError()) end
    cb.buf_vec[cb.start] = item #Assignment here to respect tests and their required behavior

    cb.start -= 1
    if (cb.start == 0) cb.start = cb.cb_capacity end
    if (isfull(cb) && overwrite) cb.finish -= 1 end
    if (cb.finish == 0) cb.finish = cb.cb_capacity end
    if (!isfull(cb)) cb.cb_len += 1 end

    return cb
end

function pop!(cb::CircularBuffer)
    if isempty(cb) throw(BoundsError()) 
    else
        cb.cb_len -= 1
        ret_val = cb.buf_vec[cb.finish]
        cb.finish -= 1
        if (cb.finish == 0) cb.finish = cb.cb_capacity end
        return ret_val
    end
end

