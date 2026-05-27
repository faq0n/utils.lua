-- Create an empty stack

local S = {}

function S.push(stack,element)
    table.insert(stack,element)
end


function S.pop(stack)
    table.remove(stack)
end

function S.isEmpty(stack)
    return #stack == 0
end

-- Function to get the top element

function S.top(stack)

    if not S.isEmpty(stack) then
        return stack[#stack]
    else
        return nil
    end
end

return S

