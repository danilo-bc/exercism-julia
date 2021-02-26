function raindrops(number)
    if number % 3 == 0
        if number % 5 == 0
            if number % 7 == 0
                return "PlingPlangPlong"
            else
                return "PlingPlang"
            end
        else
            if number % 7 == 0
                return "PlingPlong"
            else
                return "Pling"
            end
        end
    else
        if number % 5 == 0
            if number % 7 == 0
                return "PlangPlong"
            else
                return "Plang"
            end
        else
            if number % 7 == 0
                return "Plong"
            end
        end
    end
    return string(number)
end
