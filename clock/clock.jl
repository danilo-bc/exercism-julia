using Dates
import Base.+
import Base.==
import Base.-

mutable struct Clock{T<:Integer}
    hours::T
    minutes::T
end

function normalize_time(c::Clock)
    c.hours += (c.minutes ÷ 60)
    c.minutes %= 60

    if c.minutes < 0
        c.hours -= 1
        c.minutes += 60 
    end

    c.hours %= 24
    if c.hours < 0
        c.hours += 24
    end

    return c
end

function Base.show(io::IO, c::Clock)
    normalize_time(c)
    print(io, "\"", lpad(c.hours, 2, '0'), ":", lpad(c.minutes, 2, '0'), "\"")
end

function +(x::Clock, y::Dates.Minute)
    x.minutes += y.value
    normalize_time(x)
    return x
end

function -(x::Clock, y::Dates.Minute)
    return +(x::Clock, -y::Dates.Minute)
end

function ==(x::Clock, y::Clock)
    normalize_time(x)
    normalize_time(y)
    return ((x.hours == y.hours) && (x.minutes == y.minutes))
end
