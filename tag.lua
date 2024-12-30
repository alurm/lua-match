return function(tag, value)
  setmetatable(value, {
    __call = function(value, switch)
      local case = switch[tag]
      if case then return case(value) end
      local default = switch[false]
      if default then return default() end
      error('no match for tag ' .. tag)
    end
  })
  return value
end
