Entry = {}
Entry.DataList = {}
Entry.Function = {}
Entry.__index = Entry

-- Import Section
local Getch = require("getch")

---Show all entries from the data store
---@return void
function Entry.Function:all()
  if next(Entry.DataList) == nil then
    print("No entries found")
  else
    for number, name in pairs(Entry.DataList) do
      print(name .. ": " .. number)
    end
  end

  Getch:char()
end

---Create a new entry in the data store
---@param name string
---@param number string
---@return void
function Entry.Function:create(name, number)
  if Entry.DataList[number] then
    print("Data with number " .. number .. " already exist")
    return
  end

  Entry.DataList[number] = name
  print("Entry added!")
end

---Show a single entry from the data store
---@param number string
---@return void
function Entry.Function:show(number)
  if not Entry.DataList[number] then
    print("No entry found for " .. number)
  else
    print(Entry.DataList[number] .. ": " .. number)
  end

  Getch:char()
end

---Edit a single entry from the data store
---@param name string
---@param number string
---@return void
function Entry.Function:edit(name, number)
  if not Entry.DataList[number] then
    print("No entry found for " .. name)
    return
  end

  Entry.DataList[number] = name
end

---Delete a single entry from the data store
---@param number string
---@return void
function Entry.Function:destroy(number)
  if not Entry.DataList[number] then
    print("No entry found for " .. name)
    return
  end

  Entry.DataList[number] = nil
end

---Ask a question to the user
---@param type string
---@return object
function Entry.Function:question(type)
  local answers = {}

  if type == "single" then
    print("Please enter a number: ")
    answers.number = io.read()
  else
    print("Please enter a name: ")
    answers.name = io.read()

    print("Please enter a number: ")
    answers.number = io.read()
  end

  return answers
end

return Entry
