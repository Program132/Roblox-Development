local DDS = game:GetService("DataStoreService")
local PlayerSave = DDS:GetDataStore("Save")
local PlayerInSaving=0

game.Players.PlayerAdded:Connect(function(player)
    
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player
    
    -------------------------------------------
    local IronIngot = Instance.new("IntValue")
    IronIngot.Name = "IronIngot"
    IronIngot.Parent = leaderstats
   
    local IronRod = Instance.new("IntValue")
    IronRod.Name = "IronRode"
    IronRod.Parent = leaderstats
    
    local IronPlate = Instance.new("IntValue")
    IronPlate.Name = "IronPlate"
    IronPlate.Parent = leaderstats

    local Update = Instance.new("IntValue")
    Update.Name = "Update"
    Update.Parent = player

    --------------------- Save -------------------------
    
    local maTable= nil
    local Succ, err = pcall(function()
        maTable=PlayerSave:GetAsync(player.UserId) or nil
    end)
    if Succ then
        local saveSuccesValue = Instance.new("BoolValue", player)
        saveSuccesValue.Name="saveSuccesValue"
    else
        player:Kick("Sorry, load save failed. Please rejoin to retry!")
    end
    if maTable~=nil and Succ then
        print(maTable["IronIngot"])
        
        IronIngot.Value = maTable["IronIngot"]
        IronRod.Value =  maTable["IronRode"]
        IronPlate.Value = maTable["IronPlate"] 
        Update.Value = maTable["Update"] 
    end
while true do
        wait(360)   
        PlayerInSaving=PlayerInSaving+1
        local save = {}
        save["IronIngot"]=player.leaderstats.IronIngot.Value
        save["IronRode"]=player.leaderstats.IronRode.Value
        save["IronPlate"]=player.leaderstats.IronPlate.Value
        save["Update"]=player.Update.Value
        pcall(function()
            PlayerSave:SetAsync(player.UserId, save)
        end)
        PlayerInSaving=PlayerInSaving-1
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if player:FindFirstChild("saveSuccesValue") then
        PlayerInSaving=PlayerInSaving+1
        local save = {}
        save["IronIngot"]=player.leaderstats.IronIngot.Value
        save["IronRode"]=player.leaderstats.IronRode.Value
        save["IronPlate"]=player.leaderstats.IronPlate.Value
        save["Update"]=player.Update.Value
        pcall(function()
            PlayerSave:SetAsync(player.UserId, save)
        end)
        PlayerInSaving=PlayerInSaving-1
    end
end)

game.OnClose = (function()
    if PlayerInSaving>0 then
        print("Blocking shutdown for saving")
        while PlayerInSaving>0 do wait() end
        print("Done saving")
    end
end)