-- utils/utils.lua

local utils = {}

-- loads module from 'utils' dir
function utils.require_local(module_name)
    -- get path to calling script e.g. main.lua
    local source = debug.getinfo(1, "S").source

    local script_dir = source:match("@(.*)[/\\]")
    
    if not script_dir then
        script_dir = "." -- fallback for REPL or error
    end
    
    -- build path: ./utils/<module_name>.lua
    local path_to_add = script_dir .. "/utils/" .. module_name .. ".lua"
    package.path = package.path .. ";" .. path_to_add
    
    return require(module_name)
end

-- optional: if one wants module to be always available 
-- utils.prompt = utils.require_local("prompt") 

return utils
