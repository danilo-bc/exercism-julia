using Random

mutable struct Robot
    name_letters::String
    name_numbers::Int32
    Robot() = new(generate_unique_robot_name()...)
end

robot_name_pool = Set()
function generate_unique_robot_name()
    letter_part::String = randstring('A':'Z', 2)
    number_part::Int32 = rand(0:999)
    
    while (letter_part, number_part) ∈ robot_name_pool
        letter_part = randstring('A':'Z', 2)
        number_part = rand(0:999)
    end

    push!(robot_name_pool, (letter_part, number_part))
    return letter_part, number_part
end

function reset!(instance::Robot)
    instance.name_letters, instance.name_numbers = generate_unique_robot_name()
end

function name(instance::Robot)
    return instance.name_letters*lpad(instance.name_numbers, 3, '0')
end
