-- Function to create a new set
function newSet()
    local set = {}
    return set
end


-- Function to check if an element exists in the set
function contains(set,element)
    return set[element] ~= nil
end

-- Function to add an element to the set
function add(set,element)
    set[element] = true
end

-- Function to remove an element from the set
function remove(set,element)
    set[element] = nil
end

-- Function to get the size of the set
function size(set)
    local count = 0
    for _ in pairs(set) do
        count = count + 1
    end
    return count
end
