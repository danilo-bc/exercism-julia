using Dates: value, Minute
import Base.+
import Base.==
import Base.-

struct Clock{T<:Integer}
    hours::T
    minutes::T

    function Clock(hours, minutes)
        new{Integer}(normalize_time(hours, minutes)...)
    end

    function normalize_time(hours, minutes)
        hours += (minutes ÷ 60)
        minutes %= 60
    
        if minutes < 0
            hours -= 1
            minutes += 60 
        end
    
        hours = mod(hours, 24)
    
        return hours, minutes
    end
end

function Base.show(io::IO, c::Clock)
    print(io, "\"", lpad(c.hours, 2, '0'), ":", lpad(c.minutes, 2, '0'), "\"")
end

function +(x::Clock, y::Dates.Minute)
    return Clock(x.hours, x.minutes + Dates.value(y))
end

function -(x::Clock, y::Dates.Minute)
    return +(x::Clock, -y::Dates.Minute)
end

function ==(x::Clock, y::Clock)
    return ((x.hours == y.hours) && (x.minutes == y.minutes))
end
