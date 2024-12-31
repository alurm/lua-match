local tag = dofile'tag.lua'

local a_rectangle = tag('rectangle', { width = 10, height = 20 })
local a_circle = tag('circle', { radius = 5 })
local a_belochka = tag('squirrel', {})

local function area_without_default(shape)
  return shape {
    circle = function(c) return 3.1415 * c.radius * c.radius end,
    rectangle = function(s) return s.height * s.width end,
  }
end

local function area_with_default(shape)
  return shape {
    circle = function(c) return 3.1415 * c.radius * c.radius end,
    rectangle = function(s) return s.height * s.width end,
    [false] = function() return 9999 end
  }
end

print(area_with_default(a_rectangle))
print(area_with_default(a_circle))
print(area_with_default(a_belochka))

print(area_without_default(a_rectangle))
print(area_without_default(a_circle))

-- This will throw an error.
ok, error = pcall(function() print(area_without_default(a_belochka)) end)
if not ok then print(error) end
