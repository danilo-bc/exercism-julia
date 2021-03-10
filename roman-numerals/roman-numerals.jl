# I, V, X, L, C, D, M

function encode_digit(code, dig)
    # code is a 3-element tuple containing the appropriate
    # greek letters according to the digit's position in the number
    res = ""
    if dig < 4
        res *= code[1]^(dig)
    elseif dig == 4
        res *= code[1]*code[2]
    elseif dig < 9
        res *= code[2]*(code[1]^(dig-5))
    elseif dig == 9
        res *= code[1]*code[3]
    end
    return res
end

function to_roman(number)
    if number < 1
        throw(ErrorException("Cannot convert negative numbers"))
    else
        roman_code = ('I', 'V', 'X', 'L', 'C', 'D', 'M')

        num_digits = digits(number, pad=4)
        res = ""
        if num_digits[4] > 0
            # No further logic because max value is 3000
            res *= roman_code[7]^(num_digits[4])
        end

        for i = 3:-1:1
            if num_digits[i] > 0
                res *= encode_digit(roman_code[i+i-1:i+i+1], num_digits[i])
            end
        end
    end

    return res
end
