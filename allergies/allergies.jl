function allergic_to(score, allergen)
    test_list = allergy_list(score)
    
    return allergen in test_list

end

function allergy_list(score)
    ref_list = [
        "eggs","peanuts","shellfish","strawberries",
        "tomatoes","chocolate","pollen","cats" 
    ]
    test = sum(x->2^x for x in 0:7)
    for i in 7:-1:0
        if score >= test
            return Set(ref_list[1:i+1])
        else
            test = test - 2^i
        end
    end
    
    return Set()
end
