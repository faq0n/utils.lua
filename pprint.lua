-- Helper function for pretty printing Lua tables
local function pretty_print(tbl, indent_level)
    indent_level = indent_level or 0
    local indent = string.rep("  ", indent_level) -- 2 spaces per level
    
    local type_tbl = type(tbl)
    
    if type_tbl == "table" then
        -- Check if it's an array (sequential keys 1, 2, 3...)
        local is_array = true
        for k, v in pairs(tbl) do
            if type(k) ~= "number" or k < 1 or k ~= math.floor(k) then
                is_array = false
                break
            end
        end
        
        local result = {}
        result[#result + 1] = "{\n"
        
        local count = 0
        for k, v in ipairs(tbl) do -- Use ipairs for array-like parts
            count = count + 1
            result[#result + 1] = indent .. "  " .. pretty_print(v, indent_level + 1) .. ","
            -- If mixed table, we need to handle non-sequential keys too
        end
        
        -- Handle non-sequential keys (if any, e.g., named fields)
        if not is_array then
            for k, v in pairs(tbl) do
                if type(k) == "string" then
                    -- Check if this key was already processed by ipairs (if it's a number)
                    if type(k) ~= "number" or k < 1 or k ~= math.floor(k) then
                        result[#result + 1] = indent .. "  " .. tostring(k) .. " = " .. pretty_print(v, indent_level + 1) .. ","
                    end
                end
            end
        end
        
        result[#result + 1] = indent .. "}"
        return table.concat(result)
    elseif type_tbl == "string" then
        return string.format("%q", tbl) -- Print with quotes and escape chars
    elseif type_tbl == "number" then
        return tostring(tbl)
    elseif type_tbl == "boolean" then
        return tostring(tbl)
    elseif type_tbl == "nil" then
        return "nil"
    else
        return tostring(tbl)
    end
end

-- Simple wrapper for one-liner usage
function pprint(tbl)
    print(pretty_print(tbl))
end

-- Example usage:
-- local data = {
--     name = "Test",
--     numbers = {1, 2, 3},
--     nested = {
--         deep = { "value" },
--         flag = true
--     },
--     empty = {}
-- }
-- pretty_print_table(data)
