function label(colors)
    # Make a dictionary to relate colors with digits
    colorDict = Dict(
        "black" => 0,
        "brown" => 1,
        "red"   => 2,
        "orange" => 3,
        "yellow" => 4,
        "green" => 5,
        "blue" => 6,
        "violet" => 7,
        "grey" => 8,
        "white" => 9
    )
    # Calculate the actual value using the given formula
    value = (colorDict[colors[1]] * 10 + colorDict[colors[2]]) * 10^colorDict[colors[3]]

    # Format output as a string
    if (value % 1000) == 0
        return string(value÷1000)*" kiloohms"
    else
        return string(value)* " ohms"
    end
    
    
end
