local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if gameID = 466821342834324
then 

local Window = Rayfield:CreateWindow({
   Name = "RYZWare - Universal Script Hub",
   Icon = 0, 
   LoadingTitle = "RYZWare Loaded!",
   LoadingSubtitle = "Feel free to use!",
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "RYZWare"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "ZFDbWPyF3N", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "",
      Subtitle = "",
      Note = "", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠Home")
local Section = MainTab:CreateSection("Main")


local Button = MainTab:CreateButton({
   Name = "Execute Infinite Yield",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
   
})

local Button = MainTab:CreateButton({
   Name = "Execute DarkDex V3",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
   end,
   
})

local Button = MainTab:CreateButton({
    Name = "Execute Universal Vehicle Script",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Documantation12/Universal-Vehicle-Script/main/Main.lua'))()
    end,
    
 })
local Slider = MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {10, 200},  -- Min is 50, Max is 200
    Increment = 10,     -- Increment step
    Suffix = "Jump Power",  -- Suffix to show beside the slider
    CurrentValue = 50,  -- Initial value
    Flag = "JumpPowerSlider", -- Flag for saving this value
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.JumpPower = Value
        end
    end,
})

game:GetService("RunService").Heartbeat:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character.Humanoid
        if humanoid.JumpPower ~= Slider.CurrentValue then
            humanoid.JumpPower = Slider.CurrentValue
        end
    end
end)

-- Continuously update Jump Power in case it gets reset after jumping
game:GetService("RunService").Heartbeat:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character.Humanoid
        if humanoid.JumpPower ~= Slider.CurrentValue then
            humanoid.JumpPower = Slider.CurrentValue
        end
    end
end)

local Slider = MainTab:CreateSlider({
    Name = "Bypassed Walkspeed",  
    Range = {0, 100},  
    Increment = 1,  
    Suffix = "Speed",  
    CurrentValue = 1,  
    Flag = "Slider1",  
    Callback = function(Value)
        speed = Value / 10  
    end,
})

local userInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local humanoidRootPart
local moving = false  -- Flag to check if 'W' is pressed

-- Function to update references when character respawns
local function onCharacterAdded(character)
    -- Wait for the HumanoidRootPart of the new character
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end

player.CharacterAdded:Connect(onCharacterAdded)


if player.Character then
    onCharacterAdded(player.Character)
end

-- Function to handle movement when 'W' is pressed
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end  -- Ignore if game has already processed the input
    if input.KeyCode == Enum.KeyCode.W then
        moving = true  -- Start moving when 'W' is pressed
    end
end)


userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        moving = false  -- Stop moving when 'W' is released
    end
end)


game:GetService("RunService").Heartbeat:Connect(function()
    if moving and humanoidRootPart then
        local currentCFrame = humanoidRootPart.CFrame
        local direction = currentCFrame.LookVector * speed  -- Move in the direction the player is facing
        humanoidRootPart.CFrame = currentCFrame + direction  -- Apply the movement
    end
end)

local Button = MainTab:CreateButton({
   Name = "Execute NPatch Bypass [Chat Bypasser]",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/AlgariBot/lua/refs/heads/Lua-Script-Executor/LocalNeverPatchedBypass.txt"))()
   end,
   
})

local Button = MainTab:CreateButton({
   Name = "Execute AutoReport By BlueSide",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts00/UniversalRYZ/refs/heads/main/AutoReportByBlueSide.txt"))()
   end,
   
})