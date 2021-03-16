function collatz_steps(input)
    if input < 1
        throw(DomainError(input))
    else
        counter = 0
        while(input > 1)
            input % 2 == 0 ? input ÷= 2 : input = 3*input + 1
            counter += 1
        end
    end

    return counter
end