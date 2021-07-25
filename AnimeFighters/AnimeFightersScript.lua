-- AnimeFightersScript
-- lumin#6464

--used for locking onto boss
local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__Bindable__9 = l__ReplicatedStorage__1:WaitForChild("Bindable");

-- Gets UI
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("Anime Fighters")

local Info = MainUI.AddPage("Info", false)
local Page1 = MainUI.AddPage("Farm", false)
local Page2 = MainUI.AddPage("Teleports", true)
local Page3 = MainUI.AddPage("MISC",false)
local Page4 = MainUI.AddPage("***", false)

--Info page
local FirstLabel = Info.AddLabel("Made by: lumin#6464")
local FirstLabel = Info.AddLabel("Thanks to ---------")
local FirstLabel = Info.AddLabel("UI Made by: twinky marie")
local FirstLabel = Info.AddLabel("This was purely made for fun")
local FirstLabel = Info.AddLabel("If you get banned that on you")


--Auto Farm Stuff
local mobs = {}
local mob = nil
local farm = false

for i,v in pairs(game:GetService("Workspace").Worlds:GetDescendants()) do
	if v.Parent.Name == "Enemies" and not table.find(mobs,v.DisplayName.Value) then
		table.insert(mobs,v.DisplayName.Value)
	end
end

local Label = Page1.AddLabel("Auto Farm")


local Toggle = Page1.AddToggle("Auto Farm", false, function(value)
    farm = value
end)

local Dropdown = Page1.AddDropdown("Enemy", mobs, function(value)
    mob = value
end)

local Magnet = Page1.AddButton("Magnet", function()
    getgenv().autoCoin = true -- true/false

    while getgenv().autoCoin == true and wait() do
        for i,v in pairs(game:GetService("Workspace").Effects:GetDescendants()) do
            if v.Name == "Base" then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end	
end)

game:GetService('RunService').Stepped:connect(function()
	if farm then
		pcall(function()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end)		
	end
end)
spawn(function()
	while wait() do
		if farm then
			for i,v in pairs(game:GetService("Workspace").Worlds:GetDescendants()) do
				if v:FindFirstChild("DisplayName") and v.DisplayName.Value == mob and v:FindFirstChild("HumanoidRootPart") and farm then
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Effects:GetDescendants()) do
							if v.Name == "Base" then
								v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
							end
						end
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.CFrame.Position + Vector3.new(0,0,0))
wait(.2)
						repeat wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.CFrame.Position + Vector3.new(0,0,0))
							for i,k in pairs(game:GetService("Workspace").Pets:GetDescendants()) do
								if k.Name == "Owner" and k.Value == game.Players.LocalPlayer and not k.Parent.Attacking.Value then
									l__Bindable__9.SendPet:Fire(v, false);
								end
							end	
							game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer()
						until v.Health.Value <= 0 or v == nil or v.HumanoidRootPart == nil or v.DisplayName.Value ~= mob or not farm
					end)
				end
			end
		end
	end
end)

--Teleports
local DBZT = Page2.AddButton("DBZ", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-2382,-185,435)
end)

local NatutoT = Page2.AddButton("Naruto", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-91,-183,2606)
end)

local JoJoT = Page2.AddButton("JoJo", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(174,-183,-1458)
end)

local OnePT = Page2.AddButton("One Piece", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(1711, -182,297)
end)

local MHAT = Page2.AddButton("MHA", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1987.42, -184.975,2040.42)
end)

local AOTT = Page2.AddButton("AOT", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-713.441, -183.392,546.039)
end)

local DemonT = Page2.AddButton("Demon Slayer", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-3165.29, -184.131,-1031.87)
end)

local TokyoT = Page2.AddButton("Tokyo Ghoul", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1922.44, -183.392, -1584.56)
end)

local HxHT = Page2.AddButton("HxH", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(1677.22, -182.801, 2275.44)
end)

local SAOT = Page2.AddButton("SAO", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(361, -184, -512)
end)

--MISC
local camclip = Page3.AddButton("camclip", function()
    camclip = true
	game:GetService('RunService').Stepped:connect(function()
		if camclip then
			game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
		end
	end)
end)

local AntiAFK = Page3.AddButton("AntiAFK", function()
    local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
   		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  		wait(1)
   	    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end) 
end)

local InfiZoom = Page3.AddButton("Infinite Zoom", function()
    game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 999999999
end)

local InfiJump = Page3.AddButton("Infinite Jump", function()
    InfiniteJumpEnabled = true
		game:GetService("UserInputService").JumpRequest:connect(function()
		if InfiniteJumpEnabled then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
end)

local Speed = Page3.AddSlider("Speed", {Min = 0, Max = 100, Def = 20}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)


--*** page

local ServerHop = Page4.AddButton("Server Hop", function()
    game:GetService("TeleportService"):Teleport(6299805723, game:GetService("Players").LocalPlayer)
end)


local test = Page4.AddButton("Don't Use", function()
    while wait() do
		game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer()
	end
end)