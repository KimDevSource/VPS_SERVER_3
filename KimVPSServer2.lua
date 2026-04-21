--[[
    KIMVPS - Roblox Integration Script
    Version: 1.0.2 (Alpha)
    Developer: TheOfficialKim
    Description: Syncing Game Server with KimVPS Cloud
]]

local KimVPS = {
    Config = {
        ServerName = "KIM-NODE-ROBLOX",
        AutoSync = true,
        DebugMode = true
    },
    Stats = {
        CPU = 0,
        RAM = 0,
        Status = "Connecting..."
    }
}

-- ฟังก์ชันจำลองการโหลด (Fake Loading)
local function Notify(title, text)
    print("[\033[36mKimVPS\033[0m] " .. title .. ": " .. text)
    -- ถ้าใช้ใน Roblox จริงๆ สามารถเปลี่ยนเป็น StarterGui:SetCore("SendNotification") ได้
end

function KimVPS:Initialize()
    Notify("SYSTEM", "Initializing KimVPS Core...")
    wait(1.5)
    
    if self.Config.AutoSync then
        self:SyncWithGitHub()
    end
end

function KimVPS:SyncWithGitHub()
    Notify("SYNC", "Fetching data from kimdev-source/Vps...")
    wait(2)
    
    -- จำลองการดึงสถานะ
    self.Stats.Status = "ONLINE"
    self.Stats.CPU = math.random(5, 12)
    self.Stats.RAM = 0.8
    
    Notify("SUCCESS", "System Synced! Status: " .. self.Stats.Status)
end

function KimVPS:StartMonitor()
    spawn(function()
        while wait(2) do
            self.Stats.CPU = math.random(5, 15)
            self.Stats.RAM = 0.8 + (math.random() * 0.2)
            
            -- แสดงผลแบบ Log ใน Console
            warn("--- KimVPS Real-time Monitor ---")
            print("CPU Usage: " .. tostring(self.Stats.CPU) .. "%")
            print("Memory Usage: " .. string.format("%.2f", self.Stats.RAM) .. " GB")
            print("--------------------------------")
        end
    end)
end

-- รันระบบ
KimVPS:Initialize()
KimVPS:StartMonitor()

return KimVPS
