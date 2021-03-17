using Random

mutable struct Robot
    robot_name::String
    Robot() = new(generate_unique_robot_name())
end

const robot_name_pool = Set{String}()
# This is the limit of available Robot names based on problem constraints
const name_limit = (26^2)*(10^3)

function generate_unique_robot_name()
    length(robot_name_pool) == name_limit && throw(ErrorException("There are no more unique robot names"))
    robot_name = ""
    while true
        robot_name = randstring('A':'Z', 2)*randstring('0':'9', 3)
        robot_name ∉ robot_name_pool && break
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
