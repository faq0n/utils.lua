-- utilua

local utils = {}

-- loads module from 'lib' dir
function utils.require_local(module_name)
    -- get path to calling script e.g. main.lua
    local source = debug.getinfo(2, "S").source

    local script_dir = source:sub(2):match("(.*)[/\\]")
  
    if not script_dir then
        script_dir = "." -- fallback for REPL or error
    end
    
    -- build path: ./lib/<module_name>.lua
    local path_to_add = script_dir .. "/lib/" .. module_name .. ".lua"
    package.path = package.path .. ";" .. path_to_add
    
    return require(module_name)
end

-- optional: if one wants module to be always available 
-- utils.prompt = utils.require_local("prompt") 

return utils
