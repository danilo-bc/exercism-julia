function score(str)
    total = 0
    str = lowercase(str)
    for c in str
        if c in ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't']
            total += 1
        elseif c in ['d', 'g']
            total += 2
        elseif c in ['b', 'c', 'm', 'p']
            total += 3
        elseif c in ['f', 'h', 'v', 'w', 'y']
            total += 4
        elseif c == 'k'
            total += 5
        elseif c in ['j', 'x']
            total += 8
        elseif c in ['q', 'z']
            total += 10
        else
            continue
        end
    end

    return total

end
