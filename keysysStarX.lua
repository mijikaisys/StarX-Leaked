-- GUI Key System
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Description = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")

-- ScreenGui Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "KeySystemGUI"

-- Frame Properties
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Title Properties
Title.Parent = Frame
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

-- Description Properties
Description.Parent = Frame
Description.Text = "The Key Is Permanent,The key will change every 5 days or so"
Description.TextColor3 = Color3.fromRGB(200, 200, 200)
Description.Size = UDim2.new(1, -20, 0, 50)
Description.Position = UDim2.new(0, 10, 0, 35)
Description.BackgroundTransparency = 1
Description.Font = Enum.Font.SourceSans
Description.TextSize = 14
Description.TextWrapped = true

-- KeyInput Properties
KeyInput.Parent = Frame
KeyInput.PlaceholderText = "Put Key Here...."
KeyInput.Text = ""
KeyInput.Size = UDim2.new(1, -20, 0, 30)
KeyInput.Position = UDim2.new(0, 10, 0, 90)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 16

-- VerifyButton Properties
VerifyButton.Parent = Frame
VerifyButton.Text = "Check Key"
VerifyButton.Size = UDim2.new(0.5, -15, 0, 30)
VerifyButton.Position = UDim2.new(0, 10, 0, 130)
VerifyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Font = Enum.Font.SourceSans
VerifyButton.TextSize = 16

-- GetKeyButton Properties
GetKeyButton.Parent = Frame
GetKeyButton.Text = "Get Key"
GetKeyButton.Size = UDim2.new(0.5, -15, 0, 30)
GetKeyButton.Position = UDim2.new(0.5, 5, 0, 130)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.Font = Enum.Font.SourceSans
GetKeyButton.TextSize = 16

-- Fungsi untuk menyalin URL dan notifikasi
GetKeyButton.MouseButton1Click:Connect(function()
    local keyUrl = "https://codee4x.github.io/getkey/"  -- Ganti dengan URL key yang sebenarnya
    if setclipboard then
        setclipboard(keyUrl)
        -- Menampilkan notifikasi bahwa URL telah disalin
        local copiedLabel = Instance.new("TextLabel")
        copiedLabel.Parent = ScreenGui
        copiedLabel.Text = "The URL Is Already In Clipboard!"
        copiedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        copiedLabel.BackgroundTransparency = 0.5
        copiedLabel.Size = UDim2.new(0, 250, 0, 50)
        copiedLabel.Position = UDim2.new(0.5, -125, 0.8, 0)
        copiedLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        copiedLabel.Font = Enum.Font.SourceSans
        copiedLabel.TextSize = 16

        -- Menghilangkan notifikasi setelah 3 detik
        wait(3)
        copiedLabel:Destroy()
    else
        warn("Clipboard API Not Supported!")
    end
end)

-- Fungsi verifikasi key
VerifyButton.MouseButton1Click:Connect(function()
    local inputKey = KeyInput.Text
    -- Cek apakah key benar (ubah "KeyBenar123" dengan key yang sesuai)
    if inputKey == "TSwUlO1WGEOqhqB3" then
        -- Hapus GUI dan jalankan script setelah key benar
        ScreenGui:Destroy()

        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/StarX-exploit/executed/refs/heads/main/exe.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CodeE4X/miaw/refs/heads/main/miaw.lua"))()
    else
        -- Jika salah, beri pesan error
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Key Wrong, Maybe key changed or Sometng"
    end
end)
