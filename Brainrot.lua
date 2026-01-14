-- BrainrotPickup.lua
-- Coloca este script en ServerScriptService

local Players = game:GetService("Players")

-- Nombre del objeto que se puede recoger
local BRAINROT_NAME = "Brainrot"

-- Función para crear leaderstats
local function createLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local brainrots = Instance.new("IntValue")
	brainrots.Name = "Brainrots"
	brainrots.Value = 0
	brainrots.Parent = leaderstats
end

-- Cuando entra un jugador
Players.PlayerAdded:Connect(function(player)
	createLeaderstats(player)
end)

-- Detectar el toque del objeto
local brainrot = workspace:WaitForChild(BRAINROT_NAME)

brainrot.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid then
		local player = Players:GetPlayerFromCharacter(character)
		if player then
			local stats = player:FindFirstChild("leaderstats")
			if stats then
				stats.Brainrots.Value += 1
				brainrot:Destroy() -- elimina el objeto tras recogerlo
			end
		end
	end
end)
