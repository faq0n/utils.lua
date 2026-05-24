-- Create an empty stack

stack = {}

function push(element)
    table.insert(stack,element)
end


function pop()
    table.remove(stack)
end

function isEmpty()
    return #stack == 0
end

-- Function to get the top element

function top()

    if not isEmpty() then
        return stack[#stack]
    else
        return nil
    end
end


