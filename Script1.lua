local MyPlayer = game:GetService("Players"):WaitForChild("CBDove4")
if MyPlayer:IsA("Player") then
	local MyCharacters = {}
	repeat wait() until MyPlayer.Character
	MyPlayer.Character.Archivable = true
	local CharacterBase = MyPlayer.Character:Clone()
	CharacterBase.PrimaryPart = CharacterBase:WaitForChild("HumanoidRootPart")
	MyPlayer.Character.Archivable = false
	local function onTouched(Part: BasePart)
		if Part.Parent == nil then return end
		if Part.Parent:FindFirstChildOfClass("Humanoid") == nil then return end
		if Part.Parent == MyPlayer.Character then return end
		Part.Parent.PrimaryPart = Part.Parent:FindFirstChild("HumanoidRootPart")
		if Part.Parent.PrimaryPart then
			local CF = Part.Parent.PrimaryPart.CFrame
			Part.Parent:ClearAllChildren()
			Part.Parent:Destroy()
			local Character = CharacterBase:Clone()
			Character.Parent = MyPlayer.Character
			Character:SetPrimaryPartCFrame(CF)
			table.insert(MyCharacters,Character)
		end
	end
	game:GetService("RunService").Heartbeat:Connect(function(dt)
		local Character1 = MyPlayer.Character
		if not Character1 then return end
		local Humanoid1 = Character1:FindFirstChildOfClass("Humanoid")
		for _,Character2: Model in pairs(MyCharacters) do
			local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
			Humanoid2:Move(Humanoid1.MoveDirection,false)
			Humanoid2.Jump = Humanoid1.Jump
		end
	end)
end
