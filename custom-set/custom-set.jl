import Base: isempty

struct CustomSet
    contents
end

function isempty(cs::CustomSet) 
    return isempty(cs.contents)
end