return function(tag, object)
  setmetatable(object, {
    __call = function(object, switch)
      local f = switch[tag]
      if f then return f(object) end
      local default = switch[false]
      if default then return default() end
      error('no match for tag ' .. tag)
    end
  })
  return object
end
