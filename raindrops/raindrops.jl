
function raindrops(number)
    # Encode each number to its sound
    raindrop_code = [(3,"Pling"), (5, "Plang"), (7, "Plong")]

    # Test each pair with the number
    res = mapreduce(k -> number % k[1] == 0 ? k[2] : "", *, raindrop_code)

    if isempty(res)
        return string(number)
    else
        return res
    end
end