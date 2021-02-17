
function pythagorean_triplets(N)
    results = Array{Tuple}(undef,0)
    for a = 1:N÷2
        for b = a:N
            c = sqrt(a^2 + b^2)
            if(N == a + b + c)
                # Cast c into Int because this c should be natural!
                push!(results,(a, b, Int(c)))
            end
            if c > N
                break
            end
        end
    end
    return results

end