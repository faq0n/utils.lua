-- utils.lua holds my helper functions from lib in a single module

local function require_relative(module_name)
    -- Get the directory of the current script
    local script_dir = debug.getinfo(1, "S").source:match("^@(.*)[/\\]") or "./"
    
    -- Construct the path
    local new_path = script_dir .. "lib/" .. module_name .. ".lua"
    
    -- Add to package.path
    package.path = package.path .. ";" .. new_path
    
    return require_relative(module_name)
end

local pprint = require_relative("pprint.lua")
local prompt = require_relative("prompt.lua")
local queue = require_relative("queue.lua")
local set = require_relative("set.lua")
local stack = require_relative("stack.lua")

return {
	pprint = pprint,
        prompt = prompt,
        queue = queue,
	set = set,
	stack = stack,
}
