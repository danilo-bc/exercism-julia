using Random

mutable struct Robot
    robot_name::String
    Robot() = new(assign_unique_robot_name())
end

# Pre-generate all possible names
const number_of_possible_names = 26^2*10^3
const robot_name_list = Array{String,1}(undef, number_of_possible_names)
list_index = 1

# Generator of all possible names
const name_generator = (join([c1, c2, c3, c4, c5]) for c1 = 'A':'Z', c2='A':'Z', c3 = '0':'9', c4 = '0':'9', c5 = '0':'9')
for name in name_generator
    robot_name_list[list_index] = name
    global list_index += 1
end

# Reset index for use
list_index = 1

# Pre-shuffle a random sequence for handing out robot names
shuffle!(robot_name_list)

function assign_unique_robot_name()
    list_index > length(robot_name_list) && error("There are no more unique robot names")

    robot_name = robot_name_list[list_index]
    global list_index += 1
    return robot_name
end

function reset!(instance::Robot)
    instance.robot_name = assign_unique_robot_name()
end

function name(instance::Robot)
    return instance.robot_name
end
