function isarmstrong(num)
    return num == sum(digits(num).^length(digits(num)))
end