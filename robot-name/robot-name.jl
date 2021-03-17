using Random

mutable struct Robot
    robot_name::String
    Robot() = new(generate_unique_robot_name())
end

# Pre-generate all possible names
const number_of_possible_names = 26^2*10^3
const robot_name_list = Array{String,1}(undef, number_of_possible_names)
list_index = 1

# Generate all sequences
for c1 in 'A':'Z'
    for c2 in 'A':'Z'
        for c3 in '0':'9'
            for c4 in '0':'9'
                for c5 in '0':'9'
                    robot_name_list[list_index] = join([c1, c2, c3, c4, c5])
                    global list_index += 1
                end
            end
        end
    end
end
# reset index
list_index = 1

# Pre-generate a random sequence for handing out robot names
const name_sequence = collect(1:length(robot_name_list))
shuffle!(name_sequence)

function generate_unique_robot_name()
    list_index > length(robot_name_list) && throw(ErrorException("There are no more unique robot names"))
    robot_name = robot_name_list[name_sequence[list_index]]
    global list_index += 1
    return robot_name
end

function reset!(instance::Robot)
    instance.robot_name = generate_unique_robot_name()
end

function name(instance::Robot)
    return instance.robot_name
end
