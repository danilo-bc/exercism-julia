using Dates: value, Minute
import Base: +, - , ==, show

struct Clock{T}
    hours::T
    minutes::T

    function Clock{T}(hours, minutes) where {T}
        hours += (minutes ÷ 60)
        minutes %= 60
    
        if minutes < 0
            hours -= 1
            minutes += 60 
        end
    
        hours = mod(hours, 24)
        
        new(hours, minutes)
    end

end

Clock(hours::T, minutes::T) where {T <: Integer} = Clock{T}(hours, minutes)

show(io::IO, c::Clock) = print(io, "\"", lpad(c.hours, 2, '0'), ":", lpad(c.minutes, 2, '0'), "\"")

+(x::Clock, y::Minute) = Clock(x.hours, x.minutes + value(y))

-(x::Clock, y::Minute) = +(x, -y)

==(x::Clock, y::Clock) = (x.hours == y.hours) && (x.minutes == y.minutes)
