Getch = {}
Getch.__index = Getch

---Get a character from the keyboard
---@return string
function Getch:char()
  print("\nPlease press any key to continue")
  local key = io.read(1)
  return key
end

return Getch
