-- AnimeFightersScript
-- lumin#6464

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__Bindable__9 = l__ReplicatedStorage__1:WaitForChild("Bindable");

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
	Title = "Anime Fighters Simulator",
	Style = 1,
	SizeX = 400,
	SizeY = 350,
	Theme = "Jester",
})

local Page = X.New({
	Title = "Auto-Farm"
})
local Page2 = X.New({
	Title = "Teleports"
})
local Page3 = X.New({
	Title = "MISC"
})

-- page 1 autofarm

local mobs = {}
local mob = nil
local farm = false

for i,v in pairs(game:GetService("Workspace").Worlds:GetDescendants()) do
	if v.Parent.Name == "Enemies" and not table.find(mobs,v.DisplayName.Value) then
		table.insert(mobs,v.DisplayName.Value)
	end
end


Page.Toggle({
	Text = "On or Off",
	Callback = function(value)
		farm = value
	end,
	Enabled = false
})
Page.Dropdown({
	Text = "Choose an option",
	Callback = function(value)
		mob = value
	end,
	Options = mobs
})

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



-- page 2 Teleports

Page2.Button({
	Text = "DBZ",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-2382,-185,435)
	end
})

Page2.Button({
	Text = "Naruto",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-91,-183,2606)

	end
})
Page2.Button({
	Text = "JoJo",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(174,-183,-1458)

	end
})

Page2.Button({
	Text = "One Piece",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(1711, -182,297)

	end
})

Page2.Button({
	Text = "MHA",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1987.42, -184.975,2040.42)

	end
})

Page2.Button({
	Text = "AOT",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-713.441, -183.392,546.039)

	end
})

Page2.Button({
	Text = "DemonSlayer",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-3165.29, -184.131,-1031.87)

	end
})

Page2.Button({
	Text = "TokyoGhoul",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(-1922.44, -183.392, -1584.56)

	end
})

Page2.Button({
	Text = "HunterX",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = CFrame.new(1677.22, -182.801, 2275.44)

	end
})


-- page 3 misc

Page3.Button({
	Text = "Magnet",
	Callback = function()
		getgenv().autoCoin = true -- true/false

		while getgenv().autoCoin == true and wait() do
		    for i,v in pairs(game:GetService("Workspace").Effects:GetDescendants()) do
		        if v.Name == "Base" then
		            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		        end
		    end
		end	

	end
})

Page3.Button({
	Text = "CamClip",
	Callback = function()
		camclip = true
		game:GetService('RunService').Stepped:connect(function()
			if camclip then
				game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
			end
		end)
	end
})

Page3.Button({
	Text = "AntiAFK",
	 Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
   			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  			wait(1)
   		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end) 
end
})

Page3.Button({
	Text = "Infinite Zoom",
	Callback = function()
		game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 999999999
	end
})