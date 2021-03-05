function luhn(test_string)
    # Test for invalid characters or string size
    if length(test_string) < 2 || !all(isdigit.(collect(test_string)) .| isspace.(collect(test_string)) )
        return false
    else
        # Written summary if the code is daunting:
        # Filter out spaces, check if there's at least two numbers,
        # Create an Array out of the string to facilitate processing
        # Go through all 2nd numbers starting from the right
        # Multiply by two and subtract by 9 if necessary (probably requires refactoring)
        # Do the final check
        test_string = filter(k->isdigit(k), test_string)
        if length(test_string) < 2
            return false
        end
        test_arr = parse.(Int, collect(test_string))

        for i in length(test_arr)-1:-2:1
            test_arr[i] = test_arr[i] * 2 > 9 ? (test_arr[i] * 2) - 9 : test_arr[i] * 2
        end

        if sum(test_arr) % 10 == 0
            return true
        else
            return false
        end
    end

end