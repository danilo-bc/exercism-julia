import Base: +, -, *, /, ^, ==, >, <, >=, <=, abs, show, one, zero

struct RationalNumber{T<: Integer} <: Real
    num::T
    den::T
    function RationalNumber{T}(num, den) where{T<:Integer} 
        if den == 0 
            throw(ArgumentError("Denominator can't be 0"))
        else
            num, den = num/gcd(num, den), den/gcd(num, den)
            if den < 0
                num, den = -num,-den
            end

            new(num, den)
        end
    end
    RationalNumber{T}(num) where{T<:Integer} = new(num, 1)

end
RationalNumber(num::T, den::T) where {T<:Integer} = RationalNumber{T}(num, den)
RationalNumber(num::T) where {T<:Integer} = RationalNumber{T}(num, 1)

one(T::RationalNumber) = RationalNumber(1,1)
zero(T::RationalNumber) = RationalNumber(0,1)

+(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den + a.den * b.num, a.den * b.den)
-(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den - a.den * b.num, a.den * b.den)
*(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.num, a.den * b.den)
/(a::RationalNumber, b::RationalNumber) = RationalNumber(a.num * b.den, a.den * b.num)
^(a::Real, b::RationalNumber) = a^(b.num/b.den)
# Numerator always holds negative sign, so -1/2 == 1/-2
==(a::RationalNumber, b::RationalNumber) = a.num == b.num && a.den == b.den
>(a::RationalNumber, b::RationalNumber) = a.num/a.den > b.num/b.den
>=(a::RationalNumber, b::RationalNumber) = a.num/a.den >= b.num/b.den
<(a::RationalNumber, b::RationalNumber) = a.num/a.den < b.num/b.den
<=(a::RationalNumber, b::RationalNumber) = a.num/a.den <= b.num/b.den

==(a::RationalNumber, c::Real) = a.num/a.den == c
>(a::RationalNumber, c::Real) = a.num/a.den > c
>=(a::RationalNumber, c::Real) = a.num/a.den >= c
<(a::RationalNumber, c::Real) = a.num/a.den < c
<=(a::RationalNumber, c::Real) = a.num/a.den <= c

abs(a::RationalNumber) = RationalNumber(abs(a.num),abs(a.den))

show(io::IO, a::RationalNumber) = print(io,"$(a.num)//$(a.den)")

numerator(a::RationalNumber) = a.num
denominator(a::RationalNumber) = a.den

