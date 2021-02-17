""" 
This function receives a coordinate pair (x, y) representing
a dart throw in a game and returns a score according to the following:
If the dart lands outside the target, player earns no points (0 points).
If the dart lands in the outer circle of the target, player earns 1 point.
If the dart lands in the middle circle of the target, player earns 5 points.
If the dart lands in the inner circle of the target, player earns 10 points.
The outer circle has a radius of 10 units 
(This is equivalent to the total radius for the entire target), 
the middle circle a radius of 5 units, and the inner circle a radius of 1. 
They are all centered to the same point (That is, the circles are concentric) 
defined by the coordinates (0, 0).
"""
function score(x, y)
    # Instead of calculating the distance as usual,
    # let's try operating with the target radiuses instead
    # so: d = sqrt(x^2+y^2)
    # d^2 = x ^ 2 + y ^ 2
    # [10, 5, 1]^2 = [100, 25, 1]
    DistanceSquared =  x^2 + y^2
    if DistanceSquared > 100
        return 0
    elseif DistanceSquared ≤ 100 && DistanceSquared > 25
        return 1
    elseif DistanceSquared ≤ 25 && DistanceSquared > 1
        return 5
    else
        return 10
    end
end
