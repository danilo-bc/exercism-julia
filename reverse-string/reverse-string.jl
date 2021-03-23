"""Reverse an input string"""
function myreverse(str::String)
    res = Array{Char,1}(str)
    return join(res[end:-1:1])
end