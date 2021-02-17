using Dates
function add_gigasecond(date::DateTime)
    # After reading about the Julia Dates module
    # Period operations can be done by letting
    # Dates evaluate for you!
    return date + Dates.Second(1000000000)
end
