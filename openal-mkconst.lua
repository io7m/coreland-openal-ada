#!/usr/bin/env lua

local string_ex = require ("string_ex")
local io        = require ("io")
local argv      = arg
local argc      = table.maxn (argv)

assert (argc == 1)
local const_map = io.open (argv[1])
assert (const_map)

local constants = {}
local longest = 0

--
-- Initialize constant map
--

for line in const_map:lines() do
  local record   = string_ex.split (line, ":")
  local constant = {}

  constant.name  = record[1]:gsub ("[%s]*", "")
  constant.value = record[2]:gsub ("[%s]*", "")

  if #constant.name > longest then
    longest = #constant.name
  end

  table.insert (constants, constant)
end

--
-- Eject constants
--

for index, constant in pairs (constants) do
  io.write ("  "..constant.name)
  for index = #constant.name, longest do
    io.write (" ")
  end

  if constant.value:sub (1, 1) == "-" then
    local positive = constant.value:sub (2, #constant.value)
    io.write (" : constant := -16#"..positive.."#;\n")
  else
    io.write (" : constant := 16#"..constant.value.."#;\n")
  end
end
