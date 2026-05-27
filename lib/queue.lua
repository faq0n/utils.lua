
local queue_module = {}

-- hold a class to do OOP
local Queue = {}
Queue.__index = Queue

function Queue:enqueue(item)
    table.insert(self, item)
end

function Queue:dequeue()
    if self:isEmpty() then return nil end
    return table.remove(self, 1) -- FIFO: remove first element
end

function Queue:front()
    return self[1]
end

function Queue:size()
    return #self
end

function Queue:isEmpty()
    return #self == 0
end

-- factory function to do OOP
function queueModule.createQueue()
    local newInstance = {}
    setmetatable(newInstance, Queue)
    return newInstance
end

return queue_module




