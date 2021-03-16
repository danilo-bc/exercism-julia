using Random

mutable struct Robot
    robot_name::String
    Robot() = new(generate_unique_robot_name())
end

const robot_name_pool = Set{String}()

function generate_unique_robot_name()
    robot_name = randstring('A':'Z', 2)*randstring('0':'9', 3)
    
    while robot_name ∈ robot_name_pool
        robot_name = randstring('A':'Z', 2)*randstring('0':'9', 3)
    end

    push!(robot_name_pool, robot_name)
    return robot_name
end

function reset!(instance::Robot)
    instance.robot_name = generate_unique_robot_name()
end

function name(instance::Robot)
    return instance.robot_name
end
