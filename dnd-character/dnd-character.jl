function modifier(ability)
    return floor((ability - 10)/2)
end

function ability()
    return rand(3:18, 1)[1]
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
