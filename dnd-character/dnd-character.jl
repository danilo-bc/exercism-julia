function modifier(ability)
    return floor((ability - 10)/2)
end

function ability()
    dice_results = rand(1:6, 4)
    return sum(dice_results) - minimum(dice_results)
end

mutable struct DNDCharacter
    strength    ::Int
    dexterity   ::Int
    constitution::Int
    intelligence::Int
    wisdom      ::Int
    charisma    ::Int
    hitpoints::Int
    function DNDCharacter()
        constitution = ability()
        hitpoints = 10+modifier(constitution) 
        return new(ability(), ability(), constitution, ability(), ability(), ability(), hitpoints)
    end
end
