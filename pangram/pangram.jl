"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    # Check if either letter of UPPERCASE ('A':'Z') or lowercase ('a':'z')
    # ranges are in the input. 
    # If either are not, "any" will fail, and so will "all".
    return all(c-> any(in(input), c) , zip('a':'z','A':'Z'))

end

