using Unicode: graphemes

const TEST_GRAPHEMES = true

"""Reverse an input string"""
function myreverse(str::String)
    res = collect(graphemes(str))
    return join(res[end:-1:1])
end