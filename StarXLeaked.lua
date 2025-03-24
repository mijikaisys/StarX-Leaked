
if _G.Ran == true then return end
wait()
_G.Ran = true
repeat wait() until game:IsLoaded()
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local speedFactorPingBased
local speedFactor
local Nurysium_Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/mijikaisys/StarX-Leaked/refs/heads/main/nurysium_helper.lua"))()
local function getTrainingBall()
	for index, ball in workspace:WaitForChild("TrainingBalls"):GetChildren() do
		if ball:IsA("BasePart") and ball:GetAttribute("realBall") then
			return ball
		end
	end
end
local ismyautoparryspamming
local local_player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local standalone = false
print("[🔃]: Star X Loading...")

--//OPTIONS

local originalParryRemote
local originalResolveParryRemote 
local aivar, visualizervar, autospamvar, autoparryvar, tphitvar, autowinvar
local nurysium_Data = nil
local hit_Sound = nil
local closest_Entity = nil
local parry_remote = nil
local aura_Enabled = false
local auto_curve = false
local hit_sound_Enabled = false
local auto_spam = false
local training_mode = false
local hit_effect_Enabled = false
local anti_curve_spam_Enabled = false
local visualize_Enabled = false
local ai_Enabled = false
local auto_win = false
local tp_hit = false
local night_mode_Enabled = false
local spectate_Enabled = false
local trail_Enabled = false
local potanum = 15
local Services = {game:GetService("AdService"),game:GetService("SocialService")}

function initializate(dataFolder_name: string)
    local nurysium_Data = Instance.new('Folder', game:GetService('CoreGui'))
    nurysium_Data.Name = dataFolder_name

    hit_Sound = Instance.new('Sound', nurysium_Data)
    hit_Sound.SoundId = 'rbxassetid://6607204501'
    hit_Sound.Volume = 6
end

local function get_closest_entity(Object)
	task.spawn(function()
		local closest
		local max_distance = math.huge
		for index, entity in workspace.Alive:GetChildren() do
			if entity.Name ~= Players.LocalPlayer.Name then
				local distance = (Object.Position - entity.HumanoidRootPart.Position).Magnitude
				if distance < max_distance then
					closest_Entity = entity
					max_distance = distance
				end
			end
		end
		return closest_Entity
	end)
end

function resolve_parry_Remote()
 local temp_remote = game:GetService("VirtualUser"):WaitForChild("\n\n\n\n\n")

    if not temp_remote then
        return
    end

    if not temp_remote:IsA('RemoteEvent') then
        return
    end

    originalParryRemote = temp_remote
end

resolve_parry_Remote()

function walk_to(position)
	local_player.Character.Humanoid:MoveTo(position)
end
local function get_center()
	for _, object in workspace.Map:GetDescendants() do
		if object.Name == 'BALLSPAWN' then
			return object
		end
	end
end

local aura_table = {
	canParry = true,
	is_Spamming = false,
	parry_Range = 30,
	spam_Range = 0,  
	hit_Count = 0,
	hit_Time = tick(),
	ball_Warping = tick(),
	is_ball_Warping = false,
	last_target = nil,
}

workspace:WaitForChild("Balls").ChildRemoved:Connect(function(child)
	aura_table.hit_Count = 0
	aura_table.is_ball_Warping = false
	aura_table.is_Spamming = false
	aura_table.canParry = true
	aura_table.last_target = nil
end)

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function()
	aura_table.hit_Count += 1

	task.delay(0.185, function()
		aura_table.hit_Count -= 1
	end)
end)

-- Call resolve_parry_Remote once to initialize the originalParryRemote

--start, the real one

local MauaulSpam -- Declare MauaulSpam globally

function ManualSpam()
    -- Gui to Lua
    -- Version: 3.2
    
    if MauaulSpam then
        MauaulSpam:Destroy()
        MauaulSpam = nil
        return
    end

    MauaulSpam = Instance.new("ScreenGui")
    MauaulSpam.Name = "MauaulSpam"
    MauaulSpam.Parent = game.CoreGui
    MauaulSpam.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MauaulSpam.ResetOnSpawn = false

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = MauaulSpam
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.41414836, 0, 0.404336721, 0)
    Main.Size = UDim2.new(0.227479532, 0, 0.191326529, 0)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = Main

    local IndercantorBlahblah = Instance.new("Frame")
    IndercantorBlahblah.Name = "IndercantorBlahblah"
    IndercantorBlahblah.Parent = Main
    IndercantorBlahblah.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    IndercantorBlahblah.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IndercantorBlahblah.BorderSizePixel = 0
    IndercantorBlahblah.Position = UDim2.new(0.0280000009, 0, 0.0733333305, 0)
    IndercantorBlahblah.Size = UDim2.new(0.0719999969, 0, 0.119999997, 0)

    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(1, 0)
    UICorner_2.Parent = IndercantorBlahblah

    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint.Parent = IndercantorBlahblah

    local PC = Instance.new("TextLabel")
    PC.Name = "PC"
    PC.Parent = Main
    PC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PC.BackgroundTransparency = 1.000
    PC.BorderColor3 = Color3.fromRGB(0, 0, 0)
    PC.BorderSizePixel = 0
    PC.Position = UDim2.new(0.547999978, 0, 0.826666653, 0)
    PC.Size = UDim2.new(0.451999992, 0, 0.173333332, 0)
    PC.Font = Enum.Font.Unknown
    PC.Text = "PC: E to spam"
    PC.TextColor3 = Color3.fromRGB(57, 57, 57)
    PC.TextScaled = true
    PC.TextSize = 16.000
    PC.TextWrapped = true

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = PC
    UITextSizeConstraint.MaxTextSize = 16

    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint_2.Parent = PC
    UIAspectRatioConstraint_2.AspectRatio = 4.346

    local IndercanotTextBlah = Instance.new("TextButton")
    IndercanotTextBlah.Name = "IndercanotTextBlah"
    IndercanotTextBlah.Parent = Main
    IndercanotTextBlah.Active = false
    IndercanotTextBlah.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IndercanotTextBlah.BackgroundTransparency = 1.000
    IndercanotTextBlah.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IndercanotTextBlah.BorderSizePixel = 0
    IndercanotTextBlah.Position = UDim2.new(0.164000005, 0, 0.326666653, 0)
    IndercanotTextBlah.Selectable = false
    IndercanotTextBlah.Size = UDim2.new(0.667999983, 0, 0.346666664, 0)
    IndercanotTextBlah.Font = Enum.Font.GothamBold
    IndercanotTextBlah.Text = "OFF"
    IndercanotTextBlah.TextColor3 = Color3.fromRGB(255, 255, 255)
    IndercanotTextBlah.TextScaled = true
    IndercanotTextBlah.TextSize = 24.000
    IndercanotTextBlah.TextWrapped = true

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
    UIGradient.Parent = IndercanotTextBlah

    local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint_2.Parent = IndercanotTextBlah
    UITextSizeConstraint_2.MaxTextSize = 52

    local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint_3.Parent = IndercanotTextBlah
    UIAspectRatioConstraint_3.AspectRatio = 3.212

    local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint_4.Parent = Main
    UIAspectRatioConstraint_4.AspectRatio = 1.667

--Properties:

MauaulSpam.Name = "MauaulSpam"
MauaulSpam.Parent = game.CoreGui
MauaulSpam.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MauaulSpam.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = MauaulSpam
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.41414836, 0, 0.404336721, 0)
Main.Size = UDim2.new(0.227479532, 0, 0.191326529, 0)

UICorner.Parent = Main

IndercantorBlahblah.Name = "IndercantorBlahblah"
IndercantorBlahblah.Parent = Main
IndercantorBlahblah.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
IndercantorBlahblah.BorderColor3 = Color3.fromRGB(0, 0, 0)
IndercantorBlahblah.BorderSizePixel = 0
IndercantorBlahblah.Position = UDim2.new(0.0280000009, 0, 0.0733333305, 0)
IndercantorBlahblah.Size = UDim2.new(0.0719999969, 0, 0.119999997, 0)

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = IndercantorBlahblah

UIAspectRatioConstraint.Parent = IndercantorBlahblah

PC.Name = "PC"
PC.Parent = Main
PC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PC.BackgroundTransparency = 1.000
PC.BorderColor3 = Color3.fromRGB(0, 0, 0)
PC.BorderSizePixel = 0
PC.Position = UDim2.new(0.547999978, 0, 0.826666653, 0)
PC.Size = UDim2.new(0.451999992, 0, 0.173333332, 0)
PC.Font = Enum.Font.Unknown
PC.Text = "PC: E to spam"
PC.TextColor3 = Color3.fromRGB(57, 57, 57)
PC.TextScaled = true
PC.TextSize = 16.000
PC.TextWrapped = true

UITextSizeConstraint.Parent = PC
UITextSizeConstraint.MaxTextSize = 16

UIAspectRatioConstraint_2.Parent = PC
UIAspectRatioConstraint_2.AspectRatio = 4.346

IndercanotTextBlah.Name = "IndercanotTextBlah"
IndercanotTextBlah.Parent = Main
IndercanotTextBlah.Active = false
IndercanotTextBlah.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IndercanotTextBlah.BackgroundTransparency = 1.000
IndercanotTextBlah.BorderColor3 = Color3.fromRGB(0, 0, 0)
IndercanotTextBlah.BorderSizePixel = 0
IndercanotTextBlah.Position = UDim2.new(0.164000005, 0, 0.326666653, 0)
IndercanotTextBlah.Selectable = false
IndercanotTextBlah.Size = UDim2.new(0.667999983, 0, 0.346666664, 0)
IndercanotTextBlah.Font = Enum.Font.GothamBold
IndercanotTextBlah.Text = "OFF"
IndercanotTextBlah.TextColor3 = Color3.fromRGB(255, 255, 255)
IndercanotTextBlah.TextScaled = true
IndercanotTextBlah.TextSize = 24.000
IndercanotTextBlah.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Parent = IndercanotTextBlah

UITextSizeConstraint_2.Parent = IndercanotTextBlah
UITextSizeConstraint_2.MaxTextSize = 52

UIAspectRatioConstraint_3.Parent = IndercanotTextBlah
UIAspectRatioConstraint_3.AspectRatio = 3.212

UIAspectRatioConstraint_4.Parent = Main
UIAspectRatioConstraint_4.AspectRatio = 1.667

-- Scripts:

local function HEUNEYP_fake_script() -- IndercanotTextBlah.ColorChangeScript 
	local script = Instance.new('LocalScript', IndercanotTextBlah)

	local button = script.Parent
	local UIGredient = button.UIGradient
	local NeedToChange = script.Parent.Parent.IndercantorBlahblah
	local userInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")

	-- ColorSequences à¸ªà¸³à¸«à¸£à¸±à¸šà¸ªà¸µà¹€à¸‚à¸µà¸¢à¸§à¹à¸¥à¸°à¸ªà¸µà¹à¸”à¸‡
	local green_Color = {
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), 
		ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 255, 0)), 
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
	}

	local red_Color = {
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), 
		ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 0, 0)), 
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
	}

	local current_Color = red_Color
	local target_Color = green_Color
	local is_Green = false
	local transition = false
	local transition_Time = 1
	local start_Time

	local function startColorTransition()
		transition = true
		start_Time = tick()
	end

	RunService.Heartbeat:Connect(function()
		if transition then
			local elapsed = tick() - start_Time
			local alpha = math.clamp(elapsed / transition_Time, 0, 1)

			local new_Color = {}
			for i = 1, #current_Color do
				local start_Color = current_Color[i].Value
				local end_Color = target_Color[i].Value
				new_Color[i] = ColorSequenceKeypoint.new(
					current_Color[i].Time,
					start_Color:Lerp(end_Color, alpha)
				)
			end

			UIGredient.Color = ColorSequence.new(new_Color)

			if alpha >= 1 then
				transition = false
				current_Color, target_Color = target_Color, current_Color
			end
		end
	end)

	local function toggleColor()
		if not transition then
			is_Green = not is_Green
			if is_Green then
				target_Color = green_Color
				NeedToChange.BackgroundColor3 = Color3.new(0, 1, 0)
			else
				target_Color = red_Color
				NeedToChange.BackgroundColor3 = Color3.new(1, 0, 0)
			end
			startColorTransition()
		end
	end

	button.MouseButton1Click:Connect(toggleColor)

	userInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.E then
			toggleColor()
		end
	end)

	local Services = {game:GetService("AdService"), game:GetService("SocialService")}
	local originalParryRemote = nil

	function resolve_parry_Remote()
        local temp_remote = game:GetService("VirtualUser"):WaitForChild("\n\n\n\n\n")
        if not temp_remote or not temp_remote:IsA('RemoteEvent') then
            return
        end
        originalParryRemote = temp_remote
    end

    resolve_parry_Remote()
    
	local camera = workspace.CurrentCamera
	local mouse = game.Players.LocalPlayer:GetMouse()

	local function getClosestEntity()
		local closest_Entity = nil
		local shortestDistance = math.huge

		for _, entity in pairs(workspace.Alive:GetChildren()) do
			if entity:IsA("Model") and entity:FindFirstChild("HumanoidRootPart") then
				local screenPoint = camera:WorldToViewportPoint(entity.HumanoidRootPart.Position)
				local distanceToMouse = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

				if distanceToMouse < shortestDistance then
					closest_Entity = entity
					shortestDistance = distanceToMouse
				end
			end
		end

		return closest_Entity
	end

	RunService.RenderStepped:Connect(function()
		if is_Green and originalParryRemote then
			local closest_Entity = getClosestEntity()
			if closest_Entity then
				local cf = camera.CFrame
				local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()

				originalParryRemote:FireServer(
					0,
					CFrame.new(x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22),
					{[closest_Entity.Name] = closest_Entity.HumanoidRootPart.Position},
					{closest_Entity.HumanoidRootPart.Position.X, closest_Entity.HumanoidRootPart.Position.Y},
					false
				)
			end
		end
	end)

	
	end
coroutine.wrap(HEUNEYP_fake_script)()
local function WWJM_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		local newPosition = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	
		-- à¹ƒà¸Šà¹‰ Tween à¹€à¸žà¸·à¹ˆà¸­à¹ƒà¸«à¹‰à¸à¸²à¸£à¹€à¸„à¸¥à¸·à¹ˆà¸­à¸™à¸—à¸µà¹ˆà¸‚à¸­à¸‡ Frame à¹€à¸›à¹‡à¸™à¹„à¸›à¸­à¸¢à¹ˆà¸²à¸‡à¸£à¸²à¸šà¸£à¸·à¹ˆà¸™
		local TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:Create(gui, tweenInfo, {Position = newPosition})
		tween:Play()
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	
end
coroutine.wrap(WWJM_fake_script)()

end

local function clamp(value, min, max)
	return math.max(min, math.min(max, value))
end
local self = Nurysium_Util.getBall()
	wait(0.1)
	local Visualize = Instance.new("Part",workspace)
	local Visualize1 = Instance.new("Part",workspace)
	wait(0.5)
	Visualize.Color = Color3.new(0, 1, 0)
	Visualize.Material = Enum.Material.ForceField
	Visualize.Transparency = 0.5
	Visualize.Anchored = true
	Visualize.CanCollide = false
	Visualize.CastShadow = false
	Visualize.Shape = Enum.PartType.Ball
	Visualize.Size = Vector3.new(30,30,30)
	Visualize1.Color = Color3.new(1, 0, 0)
	Visualize1.Material = Enum.Material.ForceField
	Visualize1.Transparency = 0.5
	Visualize1.Anchored = true
	Visualize1.CanCollide = false
	Visualize1.CastShadow = false
	Visualize1.Shape = Enum.PartType.Ball
	Visualize1.Size = Vector3.new(aura_table.spam_Range, aura_table.spam_Range, aura_table.spam_Range)

	local Highlight1 = Instance.new("Highlight")
	Highlight1.Parent = Visualize1
	Highlight1.Enabled = true
	Highlight1.FillTransparency = 0
	Highlight1.OutlineColor = Color3.new(1, 1, 1)
	local Highlight = Instance.new("Highlight")
	Highlight.Parent = Visualize
	Highlight.Enabled = true
	Highlight.FillTransparency = 0
	Highlight.OutlineColor = Color3.new(1, 1, 1)
	
task.spawn(function()
	visualizervar = RunService.RenderStepped:Connect(function()
		if visualize_Enabled then
			Visualize.Transparency = 0
			Visualize.Material = Enum.Material.ForceField
			Visualize.Size = Vector3.new(aura_table.parry_Range, aura_table.parry_Range, aura_table.parry_Range)
			Visualize.CFrame = CFrame.new(local_player.Character.PrimaryPart.Position)
			Visualize1.Transparency = 0
			Visualize1.Material = Enum.Material.ForceField
			Visualize1.Size = Vector3.new(aura_table.spam_Range, aura_table.spam_Range, aura_table.spam_Range)
			Visualize1.CFrame = CFrame.new(local_player.Character.PrimaryPart.Position)
		else
			Visualize.Material = Enum.Material.ForceField
			Visualize.Transparency = 1
			Visualize1.Material = Enum.Material.ForceField
			Visualize1.Transparency = 1
		end	
	end)
end)

function getClosestEntityToMouse()
	local closest = nil
	local shortestDistance = math.huge
	local mouse = game.Players.LocalPlayer:GetMouse()

	-- Ensure workspace.Alive exists
	if not workspace:FindFirstChild("Alive") then
		return nil
	end

	-- Loop through all entities
	for _, entity in pairs(workspace.Alive:GetChildren()) do
		if entity:IsA("Model") then
			local humanoidRootPart = entity:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				-- Convert world position to screen position
				local screenPoint = camera:WorldToViewportPoint(humanoidRootPart.Position)
				local distanceToMouse = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

				-- Check if this is the closest entity so far
				if distanceToMouse < shortestDistance then
					closest = entity
					shortestDistance = distanceToMouse
				end
			else
				
			end
		else
			
		end
	end

	-- If no closest entity is found, warn the user
	if not closest then
		
	else
		
	end

	return closest
end

task.defer(function()
    local runService = game:GetService("RunService")
    local Players = game:GetService("Players")

    local function avoidWalls(startPos, targetPos)
        local direction = (targetPos - startPos).Unit
        local ray = Ray.new(startPos, direction * 10)
        local hit, hitPosition = workspace:FindPartOnRay(ray, local_player.Character)

        if hit then
            -- Wall detected, adjust path
            local adjustedDir = (targetPos - hitPosition).Unit + Vector3.new(0, 0, 0.5) -- Simple adjustment
            return startPos + adjustedDir * 10
        end

        return targetPos
    end

    aivar = runService.Heartbeat:Connect(function()
        if not ai_Enabled or not workspace.Alive:FindFirstChild(local_player.Name) then
            return
        end

        local self = Nurysium_Util.getBall()
        if not self or not closest_Entity then
            return
        end

        local hrp = closest_Entity:FindFirstChild('HumanoidRootPart')
        if not hrp then
            walk_to(local_player.Character.HumanoidRootPart.Position + Vector3.new(math.sin(tick()) * math.random(35, 50), 0, math.cos(tick()) * math.random(35, 50)))
            return
        end

        local tickNow = tick()
        local tickMod = tickNow % 4
        local ball_Position = self.Position
        local ball_Distance = local_player:DistanceFromCharacter(ball_Position)
        local player_Position = local_player.Character.PrimaryPart.Position
        local target_Position = hrp.Position
        local target_Distance = local_player:DistanceFromCharacter(target_Position)
        local target_LookVector = hrp.CFrame.LookVector
        local resolved_Position = Vector3.zero

        local target_Humanoid = closest_Entity:FindFirstChildOfClass("Humanoid")
        if target_Humanoid and target_Humanoid:GetState() == Enum.HumanoidStateType.Jumping and local_player.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            local_player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end

        if (ball_Position - player_Position):Dot(local_player.Character.PrimaryPart.CFrame.LookVector) < -0.2 and tickMod <= 2 then
            return
        end

        -- Maintain distance or get close depending on spamming state
        if aura_table.is_Spamming then
            -- When spamming, move closer to the target
            if tickMod <= 2 then
                resolved_Position = target_Position + (player_Position - target_Position).Unit * 8
            else
                resolved_Position = target_Position - target_LookVector * (math.random(8.5, 13.5) + (ball_Distance / math.random(8, 20)))
            end
        else
            -- Avoid getting too close to other players when not spamming
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= local_player and workspace.Alive:FindFirstChild(player.Name) then
                    local otherPlayerPos = player.Character and player.Character.PrimaryPart.Position
                    if otherPlayerPos and (player_Position - otherPlayerPos).Magnitude < 10 then
                        local avoidanceVector = (player_Position - otherPlayerPos).Unit * 15
                        player_Position = player_Position + avoidanceVector
                    end
                end
            end

            -- Regular pathfinding when not spamming
            if tickMod <= 2 then
                resolved_Position = target_Distance > 10 and target_Position + (player_Position - target_Position).Unit * 25
            else
                resolved_Position = target_Position - target_LookVector * (math.random(8.5, 13.5) + (ball_Distance / math.random(8, 20)))
            end
        end

        if (player_Position - target_Position).Magnitude < 8 then
            resolved_Position = target_Position + (player_Position - target_Position).Unit * 35
        end

        if ball_Distance < 8 then
            resolved_Position = player_Position + (player_Position - ball_Position).Unit * 10
        end

        -- Avoid walls before walking
        resolved_Position = avoidWalls(player_Position, resolved_Position)

        walk_to(resolved_Position + Vector3.new(math.sin(tickNow) * 10, 0, math.cos(tickNow) * 10))
    end)
end)

task.defer(function()
	autowinvar = RunService.Stepped:Connect(function()
		if auto_win and workspace.Alive:FindFirstChild(local_player.Name) then
			local self = Nurysium_Util.getBall()
			if not self then return end
			
			local player = local_player.Character
			local ball_Position = self.Position
			local ball_Distance = (player.HumanoidRootPart.Position - ball_Position).Magnitude
			
			
			local ping = game:GetService("Stats"):FindFirstChild("PerformanceStats"):FindFirstChild("Ping"):GetValue() or 0
			local adjusted_Distance = math.clamp(15 + (ping / 50), 15, 50)

			local angle = tick() * 2
			local offset = Vector3.new(math.cos(angle) * adjusted_Distance, math.sin(angle) * 5, math.sin(angle) * adjusted_Distance)
			local target_Position = ball_Position + offset

			
			player.HumanoidRootPart.CFrame = CFrame.new(target_Position, ball_Position)
		end
	end)
	tphitvar = RunService.Heartbeat:Connect(function()
        	local self = Nurysium_Util.getBall()
	if not self or not tp_hit then return end
	local player = local_player.Character
	local ball_Position = self.Position

	if tp_hit and self:GetAttribute('target') == local_player.Name and workspace.Alive:FindFirstChild(local_player.Name) then

		local safe_Distance = 10
		local direction = (ball_Position - player.HumanoidRootPart.Position).Unit
		local target_Position = ball_Position - direction * safe_Distance

		player.HumanoidRootPart.CFrame = CFrame.new(target_Position)
	end
    end)
end)

local closest_Entity_To_mouse = nil
local Takentime = tick() - aura_table.hit_Time
RunService.Heartbeat:Connect(function()
Takentime = tick() - aura_table.hit_Time
	task.spawn(function()
		closest_Entity_To_mouse = getClosestEntityToMouse()
	end)
end)

task.spawn(function()
    autospamvar = RunService.Heartbeat:Connect(function()
        -- Pre-check if auto_spam is enabled, player exists, and not in training mode
        if not auto_spam or not workspace.Alive:FindFirstChild(local_player.Name) or training_mode then
            -- Reset aura table and spam states
            aura_table.hit_Count = 0
            aura_table.is_Spamming = false
            aura_table.last_target = nil
            ismyautoparryspamming = false
            aura_table.spam_Range = 0
            return
        end

        -- Proceed only if closest entity is valid and in workspace
        if closest_Entity and workspace.Alive:FindFirstChild(closest_Entity.Name) and ((not standalone and aura_table.is_Spamming) or (standalone)) then
            local playerPosition = local_player.Character.PrimaryPart.Position
            local entityPosition = closest_Entity.HumanoidRootPart.Position
                local distanceToEntity = local_player:DistanceFromCharacter(entityPosition)
                -- Perform spam actions only when within range
                if distanceToEntity <= aura_table.spam_Range then
                    ismyautoparryspamming = true

                    -- Pre-compute values before the loop for efficiency
                    local cf = camera.CFrame
                    local randomTarget = Vector3.new(math.random(-1000, 1000), math.random(0, 1000), math.random(100, 1000))
                    local targetPosition = closest_Entity_To_mouse.HumanoidRootPart.Position
                    local fireArgs = {
                        {[closest_Entity_To_mouse.Name] = targetPosition},
                        {targetPosition.X, targetPosition.Y}
                    }

                    -- Perform spamming asynchronously for speed using task.defer
                    task.defer(function()
                        for count = 1, potanum do
                            if auto_curve then
                                originalParryRemote:FireServer(0, CFrame.new(cf.Position, randomTarget), unpack(fireArgs))
                            else
                                originalParryRemote:FireServer(0, cf, unpack(fireArgs))
                            end
                        end
                    end)
                else
                    -- Reset spam state if out of range
                    ismyautoparryspamming = false
                end
        else
            -- Reset spam state if entity is not found
            ismyautoparryspamming = false
        end
    end)

autoparryvar = RunService.Heartbeat:Connect(function()
    if not aura_Enabled or not (workspace.Alive:FindFirstChild(local_player.Name) or training_mode) then
        aura_table.hit_Time = tick() * 10
        aura_table.hit_Count = 0
        aura_table.is_ball_Warping = false
        aura_table.is_Spamming = false
        aura_table.canParry = true
        aura_table.last_target = nil
        return
    end

    local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10
    local self

    if training_mode then
        self = getTrainingBall()
    else
        self = Nurysium_Util.getBall()
    end

    if not self then
        aura_table.hit_Time = tick() * 10
        aura_table.hit_Count = 0
        aura_table.is_ball_Warping = false
        aura_table.is_Spamming = false
        aura_table.canParry = true
        aura_table.last_target = nil
        return
    end

    self:GetAttributeChangedSignal('target'):Once(function()
        aura_table.canParry = true
    end)

    if self:GetAttribute('target') ~= local_player.Name or not aura_table.canParry then
        return
    end

    self:GetAttributeChangedSignal('from'):Once(function()
        aura_table.last_target = workspace.Alive:FindFirstChild(self:GetAttribute('from'))
    end)

    get_closest_entity(local_player.Character.PrimaryPart)

    local player_Position = local_player.Character.PrimaryPart.Position
    local ball_Position = self.Position
    local ball_Velocity = self.AssemblyLinearVelocity

    if self:FindFirstChild("zoomies") then
        ball_Velocity = self.zoomies.VectorVelocity
    end

    local ball_Direction = (local_player.Character.PrimaryPart.Position - ball_Position).Unit
    local ball_Distance = (local_player.Character.PrimaryPart.Position - ball_Position).Magnitude
    local ball_Dot = ball_Direction:Dot(ball_Velocity.Unit)
    local ball_Speed = ball_Velocity.Magnitude

    -- Anti-curve mechanism: Adjust for curving velocity
    if ball_Speed < 25 or ball_Velocity.Y > 10 then
        aura_table.hit_Time = tick() * 10
        aura_table.hit_Count = 0
        aura_table.is_ball_Warping = false
        aura_table.is_Spamming = false
        aura_table.can_parry = true
        aura_table.last_target = nil
    end

    local player_Velocity = local_player.Character.HumanoidRootPart.AssemblyLinearVelocity
    local player_isMoving = player_Velocity.Magnitude > 0
    local ball_speed_Limited = math.min(ball_Speed / 1000, 0.1)
    local ball_predicted_Distance = (ball_Distance - ping / 15.3) - (ball_Speed / 3.5)

    local targetPosition = closest_Entity_To_mouse.HumanoidRootPart.Position
    local target_Distance = local_player:DistanceFromCharacter(targetPosition)
    local closest_target_Distance = local_player:DistanceFromCharacter(closest_Entity.HumanoidRootPart.Position)
    local target_distance_Limited = math.min(target_Distance / 10000, 0.1)
    local target_Direction = (local_player.Character.PrimaryPart.Position - closest_Entity.HumanoidRootPart.Position).Unit
    local target_Velocity = closest_Entity.HumanoidRootPart.AssemblyLinearVelocity
    local target_isMoving = target_Velocity.Magnitude > 0
    local target_Dot = target_isMoving and math.max(target_Direction:Dot(target_Velocity.Unit), 0)

    aura_table.spam_Range = math.clamp(math.max(math.max(ping / 8.5, 15) + ball_Speed / 7.5, 8.4), 25, 1200)
    speedFactor = 3 - (ping / 100)
    speedFactorPingBased = 6.1 - (ping / 100)
    aura_table.parry_Range = math.max(math.max(ping, 3.5) + ball_Speed / speedFactor, speedFactorPingBased)

    if target_isMoving then
        aura_table.is_Spamming = aura_table.hit_Count > 1 or (target_Distance <= aura_table.spam_Range and ball_Distance < 18 and ball_Speed > 8) and ball_Velocity.Y > -50 and ball_Dot > 0.15
    else
        aura_table.is_Spamming = aura_table.hit_Count > 1 or (target_Distance <= aura_table.spam_Range and ball_Distance < 18 and ball_Speed > 8) and ball_Velocity.Y > -50 and ball_Dot > 0.15
    end

    local velocity_angle = math.abs(math.acos(ball_Direction:Dot(ball_Velocity.Unit)))

    if ball_Dot < -0.2 then
        aura_table.ball_Warping = tick()
    end

    task.spawn(function()
        if (tick() - aura_table.ball_Warping) >= 0.15 + target_distance_Limited - ball_speed_Limited or ball_Distance <= 10 then
            aura_table.is_ball_Warping = false
            return
        end

        if aura_table.last_target then
            if (ball_Position - aura_table.last_target.HumanoidRootPart.Position).Magnitude > 35.5 or target_Distance <= 12 then
                aura_table.is_ball_Warping = false
            end
        end

        aura_table.is_ball_Warping = true
    end)

    if ball_Distance <= aura_table.parry_Range and not aura_table.is_ball_Warping and ball_Speed > 0 and ball_Dot > 0.1 then
        local cf = camera.CFrame
        local target_X = targetPosition.X
        local target_Y = targetPosition.Y

        if auto_curve then
            originalParryRemote:FireServer(
                0,
                CFrame.new(cf.Position, Vector3.new(math.random(-1000, 1000), math.random(0, 1000), math.random(100, 1000))),
                {[closest_Entity_To_mouse.Name] = targetPosition},
                {target_X, target_Y},
                false
            )
        else
            local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cf:GetComponents()
            originalParryRemote:FireServer(
                0,
                CFrame.new(x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22),
                {[closest_Entity_To_mouse.Name] = targetPosition},
                {target_X, target_Y},
                false
            )
        end

        aura_table.hit_Count = aura_table.hit_Count + 1
        task.delay(0.55 + (ping / 100), function()
            aura_table.hit_Count = aura_table.hit_Count - 1
        end)

        aura_table.hit_Time = tick()
        aura_table.canParry = false
    end

    task.spawn(function()
        repeat
            RunService.PreRender:Wait()
        until (tick() - aura_table.hit_Time) >= 1
        aura_table.canParry = true
    end)
end)
end)
-- Define a safe disconnect function to avoid errors
local function safeDisconnect(connection)
    if connection and connection.Disconnect then
        connection:Disconnect()
    end
end

-- Function to manage connections
local function manageConnection(flag, varName, runServiceFunc)
    if flag then
        if not _G[varName] then
            -- Create the RunService connection if the flag is true and connection is not already created
            _G[varName] = RunService[runServiceFunc]:Connect(function()
                -- Your code for what the connection does
            end)
        end
    else
        -- Disconnect and clear the connection if the flag is false
        safeDisconnect(_G[varName])
        _G[varName] = nil
    end
end

-- Main loop running on Heartbeat
RunService.Heartbeat:Connect(function()
    manageConnection(visualize_Enabled, "visualizervar", "Heartbeat")
    manageConnection(auto_spam, "autospamvar", "Heartbeat")
    manageConnection(aura_Enabled, "autoparryvar", "Heartbeat")
    manageConnection(tp_hit, "tphitvar", "Heartbeat")
    manageConnection(auto_win, "autowinvar", "Heartbeat")
    manageConnection(ai_Enabled, "aivar", "RenderStepped")
end)

--//night mode, trail, Spectate Scripts here

--//Night Mode
task.defer(function()
    while task.wait(1) do
        if night_mode_Enabled then
            TweenService:Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime = 1.9}):Play()
        else
            TweenService:Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime = 13.5}):Play()
        end
    end
end)

--//Trail 
task.defer(function()
    game:GetService("RunService").Heartbeat:Connect(function()

        if not local_player.Character then
            return
        end

        if trail_Enabled then
            local trail = game:GetObjects("rbxassetid://17483658369")[1]

            trail.Name = 'nurysium_fx'

            if local_player.Character.PrimaryPart:FindFirstChild('nurysium_fx') then
                return
            end

            local Attachment0 = Instance.new("Attachment", local_player.Character.PrimaryPart)
            local Attachment1 = Instance.new("Attachment", local_player.Character.PrimaryPart)

            Attachment0.Position = Vector3.new(0, -2.411, 0)
            Attachment1.Position = Vector3.new(0, 2.504, 0)

            trail.Parent = local_player.Character.PrimaryPart
            trail.Attachment0 = Attachment0
            trail.Attachment1 = Attachment1
        else

            if local_player.Character.PrimaryPart:FindFirstChild('nurysium_fx') then
                local_player.Character.PrimaryPart['nurysium_fx']:Destroy()
            end
        end

    end)
end)

--//Spectate 
task.defer(function()
    RunService.RenderStepped:Connect(function()
        if spectate_Enabled then

            local self = Nurysium_Util.getBall()

            if not self then
                return
            end

            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(workspace.CurrentCamera.CFrame.Position, self.Position), 1.5)
        end
    end)
end)

local isFPSBoosterEnabled = false  -- Status awal FPS booster

local function enableFPSBooster()
    -- Mengatur kualitas grafis ke tingkat terendah
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    -- Menghapus objek visual berlebihan di Workspace
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = false  -- Nonaktifkan semua efek partikel
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj:Destroy()  -- Hapus semua tekstur dan decal
        elseif obj:IsA("BasePart") and (obj.Material == Enum.Material.Grass or obj.Material == Enum.Material.LeafyGrass) then
            obj.Transparency = 1  -- Sembunyikan objek berumput atau berdaun
        end
    end

    -- Pengaturan pencahayaan ekstrem untuk meningkatkan FPS
    local Lighting = game:GetService("Lighting")
    Lighting.GlobalShadows = false
    Lighting.Brightness = 0  -- Atur kecerahan serendah mungkin
    Lighting.ClockTime = 12  -- Mengatur waktu ke siang hari
    Lighting.FogEnd = 9e9  -- Menghapus efek kabut
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)  -- Mengurangi kontras untuk performa

    -- Menghapus aksesori dan kosmetik dari karakter pemain
    local player = game.Players.LocalPlayer
    player.CharacterAdded:Connect(function(character)
        for _, accessory in pairs(character:GetChildren()) do
            if accessory:IsA("Accessory") or accessory:IsA("Clothing") or accessory:IsA("ShirtGraphic") then
                accessory:Destroy()  -- Hapus semua aksesori dan pakaian
            end
        end
    end)
end

local function disableFPSBooster()
    -- Mengembalikan kualitas grafis ke otomatis
    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic

    -- Mengaktifkan kembali efek visual dan detail di Workspace
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = true  -- Aktifkan semua efek partikel kembali
        elseif obj:IsA("BasePart") and (obj.Material == Enum.Material.Grass or obj.Material == Enum.Material.LeafyGrass) then
            obj.Transparency = 0  -- Tampilkan objek berumput atau berdaun kembali
        end
    end

    -- Mengembalikan pengaturan pencahayaan ke default
    local Lighting = game:GetService("Lighting")
    Lighting.GlobalShadows = true
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 1000
    Lighting.EnvironmentDiffuseScale = 1
    Lighting.EnvironmentSpecularScale = 1
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)  -- Mengembalikan warna normal

    -- Mengembalikan pakaian dan aksesori (jika script pengembalian tersedia)
end

-- Variabel kontrol untuk chams
local isChamsEnabled = false
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local chamColor = Color3.fromRGB(0, 255, 0)  -- Warna hijau
local chamTransparency = 0.5

-- Fungsi untuk menambahkan atau menghapus Chams
local function toggleChams(enable)
    isChamsEnabled = enable
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, part in ipairs(player.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    if enable then
                        -- Menambahkan Chams
                        if not part:FindFirstChild("Chams") then
                            local chams = Instance.new("BoxHandleAdornment")
                            chams.Name = "Chams"
                            chams.Adornee = part
                            chams.Color3 = chamColor
                            chams.Transparency = chamTransparency
                            chams.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
                            chams.ZIndex = 10
                            chams.AlwaysOnTop = true
                            chams.Parent = part
                        end
                    else
                        -- Menghapus Chams
                        local chams = part:FindFirstChild("Chams")
                        if chams then
                            chams:Destroy()
                        end
                    end
                end
            end
        end
    end
end

-- Menambahkan event untuk pemain yang baru bergabung
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if isChamsEnabled then
            toggleChams(true) -- Tambahkan chams jika toggle dalam keadaan aktif
        end
    end)
end)


ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if hit_sound_Enabled then
        hit_Sound:Play()
    end

    if hit_effect_Enabled then
        local hit_effect = game:GetObjects("rbxassetid://17407244385")[1]

        hit_effect.Parent = Nurysium_Util.getBall()
        hit_effect:Emit(3)

        task.delay(5, function()
            hit_effect:Destroy()
        end)

    end
end)

--[[ to prevent mishaps this linebof code of the ui starts here]]--
				

--// Services
local UserInputService = game:GetService("UserInputService");

--// Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/lates-lib/main/Main.lua"))()
local Window = Library:CreateWindow({
	Title = "Star X - ",
	Theme = "Dark",
	
	Size = UDim2.fromOffset(570, 370),
	Transparency = 0.2,
	Blurring = true,
	MinimizeKeybind = Enum.KeyCode.LeftAlt,
})

local Themes = {
	Light = {
		--// Frames:
		Primary = Color3.fromRGB(232, 232, 232),
		Secondary = Color3.fromRGB(255, 255, 255),
		Component = Color3.fromRGB(245, 245, 245),
		Interactables = Color3.fromRGB(235, 235, 235),

		--// Text:
		Tab = Color3.fromRGB(50, 50, 50),
		Title = Color3.fromRGB(0, 0, 0),
		Description = Color3.fromRGB(100, 100, 100),

		--// Outlines:
		Shadow = Color3.fromRGB(255, 255, 255),
		Outline = Color3.fromRGB(210, 210, 210),

		--// Image:
		Icon = Color3.fromRGB(100, 100, 100),
	},
	
	Dark = {
		--// Frames:
		Primary = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(35, 35, 35),
		Component = Color3.fromRGB(40, 40, 40),
		Interactables = Color3.fromRGB(45, 45, 45),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},
	
	Void = {
		--// Frames:
		Primary = Color3.fromRGB(15, 15, 15),
		Secondary = Color3.fromRGB(20, 20, 20),
		Component = Color3.fromRGB(25, 25, 25),
		Interactables = Color3.fromRGB(30, 30, 30),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},

}

--// Set the default theme
Window:SetTheme(Themes.Dark)

--// Sections
Window:AddTabSection({
	Name = "Main",
	Order = 1,
})

--// Tab [MAIN]

local AAA = Window:AddTab({
	Title = "Info",
	Section = "Star X",
	Icon = "rbxassetid://11963373994"
})

Window:AddSection({ Name = "Information", Tab = AAA }) 


Window:AddParagraph({
	Title = "Star X",
	Description = "People Call It Star X, So We use Star X Name",
	Tab = AAA
})
				
	Window:AddParagraph({
	Title = "Owner",
	Description = "CodeE4X, Fade & Akira Give This Script For Me(W Akira)Fuck Yall Think This Scripts Is Stealer",
	Tab = AAA
})	

Window:AddSection({ Name = "Updates", Tab = AAA }) 

Window:AddParagraph({
	Title = "Star X V1.111",
	Description = "Youtuber Credits",
	Tab = AAA
})

Window:AddButton({
	Title = "Kira(Old Owner Showcase My Scripts:) )",
	Description = "https://www.youtube.com/@KiraUploads",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@KiraUploads")
	end,
}) 

Window:AddButton({
	Title = "Copy Discord Link!(clik to copy)",
	Description = "https://discord.gg/EwARkGncq4",
	Tab = AAA,
	Callback = function()
		setclipboard("https://discord.gg/EwARkGncq4")
	end,
}) 

Window:AddButton({
	Title = "Copy Youtube Link!(clik to copy)",
	Description = "https://youtube.com/@starx575",
	Tab = AAA,
	Callback = function()
		setclipboard("https://youtube.com/@starx575")
	end,
}) 

--Teleport
local TeleportService = game:GetService("TeleportService")

local placeId = 121501154939356

Window:AddButton({
	Title = "Donate Our Teams!!(clik to teleport)",
	Description = "Support Owner By Joining And Donating!",
	Tab = AAA,
	Callback = function()
		local player = game.Players.LocalPlayer
		if player then
			TeleportService:Teleport(placeId, player)
		end
	end,
}) 

local Star = Window:AddTab({
	Title = "Star User",
	Section = "First User",
	Icon = "rbxassetid://11963373994"
})

Window:AddSection({ Name = "First User", Tab = Star }) 

Window:AddParagraph({
	Title = "First User",
	Description = "eeaway : 1198579785",
	Tab = Star
}) 

Window:AddSection({ Name = "Showcaser(clik to copy)", Tab = Star }) 

Window:AddButton({
	Title = "Clxty.",
	Description = "https://www.youtube.com/@Clxty.",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@Clxty.")
	end,
}) 
	
Window:AddButton({
	Title = "T4Dripz",
	Description = "https://www.youtube.com/@T4Dripz",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@T4Dripz")
	end,
}) 

Window:AddButton({
	Title = "Prymoric V2",
	Description = "https://www.youtube.com/@Prymoricv2",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@Prymoricv2")
	end,
}) 

Window:AddButton({
	Title = "Ley D Murphy",
	Description = "https://www.youtube.com/@Leydmurphyy",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@Leydmurphyy")
	end,
}) 

Window:AddButton({
	Title = "Kazu",
	Description = "https://www.youtube.com/@kazurbx",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@kazurbx")
	end,
}) 

Window:AddButton({
	Title = "R4mpage",
	Description = "https://www.youtube.com/@GetScriptFromRampage",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@GetScriptFromRampage")
	end,
}) 

Window:AddButton({
	Title = "Dat Mod",
	Description = "https://www.youtube.com/@datmodd",
	Tab = Star,
	Callback = function()
		setclipboard("https://www.youtube.com/@datmodd")
	end,
}) 

Window:AddButton({
	Title = "Robloxscriptshowcaser",
	Description = "https://www.youtube.com/@robloxscriptshowcaser-i9x",
	Tab = Star,
	Callback = function()
	    setclipboard("https://www.youtube.com/@robloxscriptshowcaser-i9x")
	end,
}) 

Window:AddButton({
	Title = "ScriptHack",
	Description = "https://www.youtube.com/@RobloxHorrorscript",
	Tab = Star,
	Callback = function()
	    setclipboard("https://www.youtube.com/@RobloxHorrorscript")
	end,
}) 

Window:AddButton({
	Title = "Jacool",
	Description = "https://www.youtube.com/@jacool123scirps",
	Tab = Star,
	Callback = function()
	    setclipboard("https://www.youtube.com/@jacool123scirps")
	end,
}) 

Window:AddButton({
	Title = "6969Player",
	Description = "https://www.youtube.com/@baconneedshair3",
	Tab = Star,
	Callback = function()
	    setclipboard("https://www.youtube.com/@baconneedshair3")
	end,
}) 

Window:AddParagraph({
	Title = "Infos",
	Description = "Sorry If Im Not Showed your Yt, Tell Me In Discord!",
	Tab = Star
})	

local Main = Window:AddTab({
	Title = "Main",
	Section = "Main",
	Icon = "rbxassetid://11963373994"
})
				
Window:AddSection({ Name = "Autoparry", Tab = Main }) 


Window:AddToggle({
	Title = "Autoparry",
	Description = "Parrys the ball [100% accuracy]",
	Tab = Main,
	Callback = function(state)
	aura_Enabled = state

	end,
}) 

Window:AddToggle({
	Title = "Autospam",
	Description = "Toggles Autospam when near player(only works on clash)",
	Tab = Main,
	Callback = function(state)
	
		auto_spam = state
	end,
}) 
				
Window:AddToggle({
	Title = "Manual spam",
	Description = "A back-up for the Auto spam",
	Tab = Main,
	Callback = function(state)
		           if state then
            ManualSpam()
            else 
            ManualSpam()
            end
	end,
}) 	
			
Window:AddSection({ Name = "Parry Misc", Tab = Main }) 
	
		Window:AddToggle({
	Title = "Auto Curve",
	Description = "Auto Curves the ball",
	Tab = Main,
	Callback = function(state)
	auto_curve = state

	end,
})
				
		Window:AddToggle({
	Title = "Anti Spam Curve",
	Description = "When spamming it cancels out the Curve",
	Tab = Main,
	Callback = function(state)
      anti_curve_spam_Enabled = state
	end,
})				
	Window:AddToggle({
	Title = "Standalone Mode",
	Description = "It Increase The Auto Spam Sensitivity",
	Tab = Main,
	Callback = function(state)
standalone = state
	end,
})			

Window:AddSection({ Name = "Autofarms", Tab = Main }) 
	
Window:AddToggle({
	Title = "Autofarm",
	Description = "Autofarms the game not 100% win rate(your own risk)",
	Tab = Main,
	Callback = function(state)
auto_win = state
	end,
})								
				
	Window:AddToggle({
	Title = "Ai play",
	Description = "Auto plays the game, may not work mody of the timed(turn on autoparry)",
	Tab = Main,
	Callback = function(state)
ai_Enabled = state
	end,
})										
				
	Window:AddToggle({
	Title = "TP Hit",
	Description = "Tp when ball is coming or targeting you",
	Tab = Main,
	Callback = function(state)
tp_hit = state
	end,
})												
				
				
Window:AddSection({ Name = "Debug", Tab = Main }) 
	
Window:AddToggle({
	Title = "View Parry Part",
	Description = "Shows the parry range",
	Tab = Main,
	Callback = function(state)
visualize_Enabled = state
	end,
})



local Visual = Window:AddTab({
	Title = "Visual",
	Section = "Visual",
	Icon = "rbxassetid://11963373994"
})
--//Spectate Ball 			
Window:AddToggle({
Title = "Spectate Ball",
Description = "Lock your Camera To Ball",
Tab = Visual,
Callback = function(toggled)
    spectate_Enabled = toggled
end,
})	

Window:AddToggle({
    Title = "Player Chams",
    Description = "Will Chams All Player",
    Tab = Visual,
    Callback = function(state)
        toggleChams(state) -- Aktifkan atau nonaktifkan chams berdasarkan status toggle
    end,
})


--//Night Mode 
Window:AddToggle({
    Title = "Night Mode",
    Description = "Game Become Night Mode",
    Tab = Visual,  -- Gantilah dengan tab yang sesuai
    Callback = function(toggled)
        night_mode_Enabled = toggled
    end,
})

Window:AddToggle({
    Title = "Player Trail",
    Description = "Give you A Trail",
    Tab = Visual,
    Callback = function(toggled)
        trail_Enabled = toggled
    end,
})


local Misc = Window:AddTab({
	Title = "Misc",
	Section = "Misc",
	Icon = "rbxassetid://11963373994"
})


Window:AddSlider({
    Title = "WalkSpeed",
    Description = "Set the WalkSpeed of your character (default: 16)",
    Tab = Misc,  -- Gantilah dengan nama tab yang sesuai
    AllowDecimals = false,  -- WalkSpeed biasanya berupa integer
    MaxValue = 100,  -- Atur batas maksimum sesuai kebutuhan
    MinValue = 0,    -- Atur batas minimum
    DefaultValue = 16,  -- Nilai default WalkSpeed
    Callback = function(Amount) 
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = Amount  -- Set WalkSpeed sesuai dengan nilai slider
        end

        -- Simpan pengaturan WalkSpeed jika perlu
        Window:SetSetting("WalkSpeed", Amount)
    end,
})

Window:AddToggle({
    Title = "FPS Booster",
    Description = "Reduce Quality game(not remove sword effect)",
    Tab = Misc,  -- Gantilah dengan tab yang sesuai
    Callback = function(state)
        isFPSBoosterEnabled = state
        if isFPSBoosterEnabled then
            enableFPSBooster()
        else
            disableFPSBooster()
        end
    end,
})



--// Tab [SETTINGS]
local Keybind = nil
local Settings = Window:AddTab({
	Title = "Settings",
	Section = "Settings",
	Icon = "rbxassetid://11293977610",
})


Window:AddDropdown({
	Title = "Set Theme",
	Description = "Set the theme of the library!",
	Tab = Settings,
	Options = {
		["Light Mode"] = "Light",
		["Dark Mode"] = "Dark",
		["Extra Dark"] = "Void",
	},
	Callback = function(Theme) 
		Window:SetTheme(Themes[Theme])
	end,
}) 

Window:AddToggle({
	Title = "UI Blur",
	Description = "If enabled, must have your Roblox graphics set to 8+ for it to work",
	Default = true,
	Tab = Settings,
	Callback = function(Boolean) 
		Window:SetSetting("Blur", Boolean)
	end,
}) 


Window:AddSlider({
	Title = "UI Transparency",
	Description = "Set the transparency of the UI(0.15 recommend)",
	Tab = Settings,
	AllowDecimals = true,
	MaxValue = 1,
	Callback = function(Amount) 
		Window:SetSetting("Transparency", Amount)
	end,
}) 

Window:Notify({
	Title = "Please Join Star X Server: https://discord.com/invite/EwARkGncq4",
	Description = "Press Left Alt or The Image To Minimize The Window.", 
	Duration = 10
})
local notificationShown = true  -- Flag to track if the notification has been shown

-- Function to repeatedly check if aura_table.is_Spamming
local function checkSpamming()
    while true do  -- Infinite loop to keep checking
        if ismyautoparryspamming and not notificationShown then
            Window:Notify({
                Title = "Spamming",
                Description = "", 
                Duration = 2
            })
            notificationShown = true  -- Set the flag to true after showing the notification
        elseif not aura_table.is_Spamming then
            notificationShown = false  -- Reset the flag when not spamming
        end
        wait(0.5)  -- Wait for 1 second before checking again (adjust as needed)
    end
end

-- Start the check in a new thread
spawn(checkSpamming)
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

-- Configure the ScreenGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Configure the ImageButton
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Image = "rbxassetid://5430597569" -- Set the image using the decal ID
ImageButton.Draggable = true

-- Add UICorner for rounded corners
UICorner.Parent = ImageButton

-- Function to handle click event
ImageButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftAlt, false, game)
end)
print("[🟢]: Loading Succesful!")
