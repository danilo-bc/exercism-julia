using Random

mutable struct Robot
    robot_name::String
    Robot() = new(assign_unique_robot_name())
end

# Pre-generate all possible names
const number_of_possible_names = 26^2*10^3

# Generator of all possible names
const robot_name_list = vec([join([c1, c2, c3, c4, c5]) for c1 = 'A':'Z', c2='A':'Z', c3 = '0':'9', c4 = '0':'9', c5 = '0':'9'])

# Pre-shuffle a random sequence for handing out robot names
shuffle!(robot_name_list)

function assign_unique_robot_name()
    isempty(robot_name_list) && error("There are no more unique robot names")

    robot_name = pop!(robot_name_list)
    
    return robot_name
end

function reset!(instance::Robot)
    # Save the old name to put it back into the list,
    # assign a new one and push the old name back
    old_name = instance.robot_name
    instance.robot_name = assign_unique_robot_name()
    push!(robot_name_list, old_name)
    shuffle!(robot_name_list)
end

function name(instance::Robot)
    return instance.robot_name
end
