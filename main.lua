-- Import Section
local Entry = require("entry")

-- Define Variable Section
local SYS_EXIT = false

---Main function
---@return void
local function main()
  print("-----------------")
  print("Welcome to Lua!")
  print("1. Show all entries")
  print("2. Create a new entry")
  print("3. Find an entry")
  print("4. Edit an entry")
  print("5. Delete an entry")
  print("6. Exit")
  print("-----------------")

  print("Please enter your selection: ")
  local option = io.read()
  option = tonumber(option)
  print("")

  if option == 1 then
    Entry.Function:all()
  elseif option == 2 then
    local answer = Entry.Function:question("multiple")
    Entry.Function:create(answer.name, answer.number)
  elseif option == 3 then
    local answer = Entry.Function:question("single")
    Entry.Function:show(answer.number)
  elseif option == 4 then
    local answer = Entry.Function:question("multiple")
    Entry.Function:edit(answer.name, answer.number)
  elseif option == 5 then
    local answer = Entry.Function:question("single")
    Entry.Function:destroy(answer.number)
  elseif option == 6 then
    print("Goodbye!")
    SYS_EXIT = true
  else
    print("Invalid option")
  end
end

-- Main Loop
while not SYS_EXIT do
  main()
end
