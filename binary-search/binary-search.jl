function binarysearch(arr, key; by = nothing, lt = < , rev = false)
    if by ≠ nothing
        arr = by.(arr)
        key = by(key)
    end

    upperBound = length(arr)
    lowerBound = 1
    trialIndex = (lowerBound + upperBound) ÷ 2

    while trialIndex > 0 && (trialIndex ≠ lowerBound || trialIndex ≠ upperBound)
        if !rev
            if lt(key, arr[trialIndex])
                upperBound = trialIndex - 1
            elseif key == arr[trialIndex]
                break
            else
                lowerBound = trialIndex + 1
            end
        else
            if lt(key, arr[trialIndex])
                lowerBound = trialIndex + 1
            elseif key == arr[trialIndex]
                break
            else
                upperBound = trialIndex - 1
            end
        end
        trialIndex = (lowerBound + upperBound) ÷ 2
    end

    if trialIndex < 1
        return 1:0
    elseif arr[trialIndex] == key
        return trialIndex:trialIndex
    else
        return trialIndex:trialIndex-1
    end
end