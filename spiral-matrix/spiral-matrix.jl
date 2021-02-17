function spiral_matrix(n)
    mat = Matrix{Int}(undef,n, n)
    if n > 0

        numberOfSpirals = ceil(Int, n/2)
        # Indexes for walking in a spiral in the 2D matrix
        i = 1
        j = 0 #This starts at 0 to be compatible with the loop
        stepCount = 1

        for ns = 0:numberOfSpirals-1
            # "Walk" to the right
            for _ = 1:n-2*ns
                j += 1
                mat[i, j] = stepCount
                stepCount += 1
            end
            # "Walk" down
            for _ = 1:n-2*ns-1
                i += 1
                mat[i, j] = stepCount
                stepCount += 1
            end
            # "Walk" to the left
            for _ = 1:n-2*ns-1
                j -= 1
                mat[i, j] = stepCount
                stepCount += 1
            end
            # "Walk" up
            for _ = 1:n-2*ns-2
                i -= 1
                mat[i, j] = stepCount
                stepCount += 1
            end
            
        end
        return mat
    else
        return mat
    end

end
