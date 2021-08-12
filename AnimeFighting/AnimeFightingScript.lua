-- AnimeFightingScript
-- lumin#6464

-- Gets UI
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("Anime Fighting")

local Info = MainUI.AddPage("Info", false)
local Page1 = MainUI.AddPage("Farm", false)
local Page2 = MainUI.AddPage("Teleports", true)
local Page3 = MainUI.AddPage("MISC",false)

--Info page
local FirstLabel = Info.AddLabel("Made by: lumin#6464")
local FirstLabel = Info.AddLabel("UI Made by: twinky marie")
local FirstLabel = Info.AddLabel("This was purely made for fun")
local FirstLabel = Info.AddLabel("If you get banned that on you")