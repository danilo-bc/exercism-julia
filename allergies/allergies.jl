function allergic_to(score, allergen)
    if score % 256 < 1
        return false
    else
        test_list = allergy_list(score)
        return allergen in test_list
    end

end

function allergy_list(score)
    ref_list = [
        "eggs","peanuts","shellfish","strawberries",
        "tomatoes","chocolate","pollen","cats" 
    ]

    res = Set()

    if score > 255
        score %= 256
    end

    for i in 7:-1:0
        if score >= 2^i
            score -= 2^i
            push!(res, ref_list[i+1])
        end
    end
    
    return res
end
