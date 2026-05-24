local prompt = {}

-- Helper to trim whitespace from both ends of a string
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- Main prompt function
-- @param message: The text to display before the input (e.g., "Enter name")
-- @param default: Optional default value if user just presses Enter
-- @param validator: Optional function that returns true if input is valid
-- @return: The user's input string (trimmed), or the default value
function prompt.ask(message, default, validator)
    local prompt_text = message
    if default ~= nil then
        prompt_text = prompt_text .. " [" .. tostring(default) .. "]> "
    else
        prompt_text = prompt_text .. "> "
    end

    io.write(prompt_text)
    io.flush() -- Ensures the prompt appears immediately
    
    local input = io.read("*l") -- Read a full line
    
    -- Handle empty input
    if not input or input == "" then
        if default ~= nil then
            return tostring(default)
        else
            -- If no default, we might want to retry or return nil. 
            -- Here we return nil to indicate "no input provided".
            return nil
        end
    end

    local trimmed_input = trim(input)

    -- Run validation if provided
    if validator then
        if not validator(trimmed_input) then
            io.write("Invalid input. Please try again: ")
            -- Recursive call for retry (simple approach)
            return prompt.ask(message, default, validator)
        end
    end

    return trimmed_input
end

return prompt
