function clean(phone_number)
    # Use filter to take all non-digit characters from the input string
    phone_number = filter(isdigit, phone_number)

    # If the first character of the filtered number is '1',
    # ignore it and use the substring starting from the second
    if(phone_number[1] == '1')
        phone_number = phone_number[2:end]
    end

    # Check if all conditions are satisfied
    if (length(phone_number) == 10) && (('2' ≤ phone_number[1] ≤ '9' ) && ('2' ≤ phone_number[4] ≤ '9'))
        return phone_number
    else
        return nothing
    end
end
