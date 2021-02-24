function triangle(n)
    if n < 0
        throw(DomainError(n,"n must be >= 1"))
    elseif n == 0
        return []
    else
        pasMat = Array{Array{Int,1},1}(undef, n)
        pasMat[1] = [1]
        for i = 2:n
            pasMat[i] = ones(Int, i)
            for j = 2:i
                if j != i
                    pasMat[i][j] = pasMat[i-1][j-1]+pasMat[i-1][j]
                end
            end
        end
        return pasMat
    end
end
