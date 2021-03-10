function isisogram(s)
    s = collect(lowercase.(filter(isletter, s)))
    return length(unique(s)) == length(s)
end
