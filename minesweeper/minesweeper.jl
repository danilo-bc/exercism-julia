function array_to_matrix(str_array)
    ncols = length(str_array[1])
    nrows = length(str_array)
    res = Matrix{Char}(undef, nrows, ncols)
    for i in 1:nrows
        for j in 1:ncols
            res[i, j] = str_array[i][j]
        end
    end

    return res
end

function add_mine_count_to_neighbours!(res, res_int)
    nrows, ncols = size(res)
    for i in 1:nrows
        for j in 1:ncols
            if res[i,j] == '*'
                for k in  i-1:i+1
                    if k < 1 || k > nrows
                        continue
                    end
                    for m in j-1:j+1
                        if m < 1 || m > ncols || res[k,m] == '*' || (k == i && m == j)
                            continue
                        end
                        res_int[k, m] += 1
                    end
                end
            end
        end
    end

    return res, res_int
end

function turn_blanks_into_adj_mine_count!(res, res_int)
    nrows, ncols = size(res)
    for i in 1:nrows
        for j in 1:ncols
            if res_int[i, j] > 0
                # this is fine since 8 is the biggest possible mine counter
                res[i, j] = '0'+res_int[i, j]
            end
        end
    end
end

function annotate(minefield)
    if length(minefield) < 1
        return minefield
    elseif minefield[1] == ""
        return minefield
    else
        res = array_to_matrix(minefield)
        res_int = zeros(Int, size(res))
        add_mine_count_to_neighbours!(res, res_int)
        turn_blanks_into_adj_mine_count!(res, res_int)
        for i in 1:length(minefield)
            minefield[i] = join(res[i,:])
        end

        return minefield
    end
end