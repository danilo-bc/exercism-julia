struct Point{T <: Int}
    x::T
    y::T
end
Point{T}(t::Tuple{T, T}) where T <: Int = Point(t[1], t[2])
Point(t::Tuple{T, T}) where T <: Int = Point{T}(t)

@enum Heading begin
    NORTH
    EAST
    SOUTH
    WEST
end

mutable struct Robot
    pos::Point
    orientation::Heading
end
Robot(t::Tuple, h::Heading) = Robot(Point(t), h)

position(r::Robot) = r.pos
heading(r::Robot) = r.orientation

function turn_right!(r::Robot)
    r.orientation = Heading(mod(Int(r.orientation)+1, 4))
    return r
end

function turn_left!(r::Robot)
    int_heading = Int(r.orientation)
    int_heading - 1 < 0 ? int_heading = 3 : int_heading -= 1
    r.orientation = Heading(int_heading)
    return r
end

function advance!(r::Robot)
    if r.orientation == NORTH
        r.pos = Point(r.pos.x, r.pos.y + 1)
    elseif r.orientation == SOUTH
        r.pos = Point(r.pos.x, r.pos.y - 1)
    elseif r.orientation == EAST
        r.pos = Point(r.pos.x + 1, r.pos.y)
    else
        r.pos = Point(r.pos.x - 1, r.pos.y)
    end
    return r
end

function move!(r::Robot, instructions::String)
    for char in instructions
        if char == 'R'
            turn_right!(r)
        elseif char == 'L'
            turn_left!(r)
        elseif char == 'A'
            advance!(r)
        else
            throw(ArgumentError("Invalid instruction string"))
        end
    end
    return r
end