import Base: +, -, *, /, ==, show, abs, conj, real, imag, isapprox, exp

struct ComplexNumber{T <: Real} <: Number
    real::T
    imag::T
    ComplexNumber{T}(real, imag) where {T <: Real} = new(real, imag)
end
ComplexNumber(real::T, imag::T) where {T <: Real} = ComplexNumber{T}(real, imag)
ComplexNumber(real::Real, imag::Real) = ComplexNumber(promote(real, imag)...)

+(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real + b.real, a.imag + b.imag)
-(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real - b.real, a.imag - b.imag)
*(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real * b. real - a.imag * b.imag, a.imag * b.real + a.real * b.imag)
/(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(Float64(a.real * b.real + a.imag * b.imag)/(b.real^2 + b.imag^2) , Float64(a.imag * b.real - a.real * b.imag)/(b.real^2 + b.imag^2))
==(a::ComplexNumber, b::ComplexNumber) = (a.real == b.real) && (a.imag == b.imag)
isapprox(x::ComplexNumber, y::ComplexNumber) = isapprox(x.real, y.real) && isapprox(x.imag, y.imag)

abs(c::ComplexNumber) = sqrt(c.real^2 + c.imag^2)
conj(c::ComplexNumber) = ComplexNumber(c.real, -c.imag)
real(c::ComplexNumber) = c.real
imag(c::ComplexNumber) = c.imag

show(io::IO, c::ComplexNumber) = print(io, c.real," " ,(c.imag >= 0 ? "+" : "-")," ", abs(c.imag),"jm")

# Bonus 1
exp(c::ComplexNumber) = ComplexNumber(exp(c.real), 0) * ComplexNumber(cos(c.imag), sin(c.imag))

# Bonus 2
const jm = ComplexNumber(0, 1)
+(a::Real, b::ComplexNumber) = ComplexNumber(a+b.real, b.imag)
*(a::Real, b::ComplexNumber) = ComplexNumber(a*b.real, a*b.imag)
