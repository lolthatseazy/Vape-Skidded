--[[ 
	VAPE PRIVATE - pls no leakage ty

	Credits
	Infinite Yield - Blink
	DevForum - lots of rotation math because I hate it
	Please notify me if you need credits
]]

local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local targetinfo = shared.VapeTargetInfo
local collectionservice = game:GetService("CollectionService")
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local bedwars = {}
local bedwarsblocks = {}
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local getfunctions
local oldchar
local oldcloneroot
local matchState = 0
local kit = ""
local antivoidypos = 0
local kills = 0
local beds = 0
local lagbacks = 0
local reported = 0
local vec3 = Vector3.new
local cfnew = CFrame.new
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local disguisecheck = false
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local storedshahashes = {}
local oldshoot
local chatconnection
local blocktable
local inventories = {}
local Hitboxes = {["Enabled"] = false}
local Reach = {["Enabled"] = false}
local Killaura = {["Enabled"] = false}
local nobob = {["Enabled"] = false}
local AnticheatBypass = {["Enabled"] = false}
local AnticheatBypassCombatCheck = {["Enabled"] = false}
local combatcheck = false
local combatchecktick = tick()
local disabletpcheck = false
local queueType = "bedwars_test"
local FastConsume = {["Enabled"] = false}
local chatconnection2
local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}
local connectionstodisconnect = {}
local anticheatfunny = false
local anticheatfunnyyes = false
local tpstring
local networkownertick = tick()
local networkownerfunc = isnetworkowner or function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownertick = tick() + 8
	end
	return networkownertick <= tick()
end
local uninjectflag = false
local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky"
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC"
	},
	ClientUsers = {}
}
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()
local entity = shared.vapeentity
local whitelisted = {
	players = {
		"edbf7c4bd824bb17954c0fee8f108b6263a23d58e1dc500157513409cd9c55433ad43ea5c8bb121602fcd0eb0137d64805aaa8c597521298f5b53d69fa82014b", 
        "94a10e281a721c62346185156c15dcc62a987aa9a73c482db4d1b0f2b4673261ec808040fb70886bf50453c7af97903ffe398199b43fccf5d8b619121493382d",
        "a91361a785c34c433f33386ef224586b7076e1e10ebb8189fdc39b7e37822eb6c79a7d810e0d2d41e000db65f8c539ffe2144e70d48e6d3df7b66350d4699c36",
        "cd41b8c39abf4b186f611f3afd13e5d0a2e5d65540b0dab93eed68a68f3891e0448d87dbba0937395ab1b7c3d4b6aed4025caad2b90b2cdbf4ca69441644d561",
        "28f1c2514aea620a23ef6a1f084e86a993e2585110c1ddd7f98cc6b3bd331251382c0143f7520153c91a368be5683d3406e06c9e35fba61f8bd2ac811c05f46b",
        "8b6c2833fa6e3a7defdeb8ffb4dcd6d4c652e6d02621c054df7c44ebaf94858ac5cbed6a6aadf0270c07d7054b7a2dd1ebf49ab20ffbc567213376c7848b8b90",
        "6662a5dfbb5311ee66af25cf9b6255c8b70f977022fcaed8fa9e6bcb4fe0159c148835d7c3b599a5f92f9a67455e0158f8977f33e9306dd4cee3efceb0b75441",
        "bdf4e13afb63148ad68cf75e25ec6f0cf11e0c4a597e8bdd5c93724a44bde2ce12eee46549a90ae4390bbfa36f8c662b7634600c552ca21d093004d473f9b23f",
        "6f3e2567502502ac053f72a3ad27eead7aeef4f0ad7b1695150040c36de8868b045ac0ac7e75dab8b9e973fea0561ad1f9fa4ea9f57bfee6ad59ff6b440640ff",
        "96fdd47dbac073243048420c583ff9ef999f5d009dcac2b40e16fb8ec08269eba30bb94c830ce82ef7711a2cd18fc43d2a495fb9ba37d42c5047fe4f1c7315a6",
        "cc5ec617693d5c0b67c591adbc3560e2b4ee11ec87a625c5a026d8d1b57d82a3965ea4874a4deabee7015c9a5a1d52d0d75e2821c36a5b5ea21f0f72e100cbb7",
        "a650c02f7ae2a15303926b520213a7b74382c0be925e649733ab9d2e028462af51cec91357647907a76029951910e9fcb524fdb8f78c6c2df4e6d56d3b215ddd",
        "ae55a45820f801cfb2e0539c079dec830f0765b2a431eaa26957bf17054e0d93fbf28e9538c812d0b79cd20bd2862a8fd930b8d4f838c1cd135344e2d6f0e85e",
        "6ff2157b9f16703f12a08980cff9f23a56e20de493b38c816dbe36f519155eb27751d1aabb10b8859850c88d8921b49fbac13d67cbfba3cca36f31afd1d4db85",
        "33cc2e81258d38699b3638e9888e0263904ae3ee5ea1f14bab25c52dc1f0eb7212bb9ea3bcb2c45a1f577286a0319ac9952f4181908161276af6db22f49901a3",
        "4316131222bddc978cea052e43b958c689190f7fc1308da43dccfc04f0cb0637c0cc328e130406993e83a1b2f63c4b2a5267080b6c344282a5314b0be6c6b79e",
        "cf22724d1d4368338f59bab33321c1ded4fdbefc5f254d832d68db49a861e9fc546049a1e7b63076e5fef2c29faf127156396433ca3c73bb6630420d6e4e4e4f",
        "75967edb96b649fdc44d81c7d1085b72cc3c638d564d7cd3cded4c1713fc7d7e8e286dcc8e2b8858634e807aa760311af077840d0a6b3a6d7a90a8d2bd3ac171",
        "34664958478e9c40b1befa4a73dac9e16d8b1e3ffe2f7a0b25f2defb1b1f8a469116970b2fc720540903b240abc9b3986fe91ef9333d4fab26945535a4af1dcd",
        "2892f7112427bcd09afbc6e57a8152839641ecf932134bb90eb0bdd730afdb6dc99829b78e2380977f529afc50d3cbca30d224b8f13dd60e465c120ef10ab651",
        "9dc7a3fd30ef6c7d68da21b8a0c954c49c78710079118892d85aac93f12025fed982a4c2184fff001c616d8f59a034d70c3d85677be383c300ed95a6984e42ac",
        "edc25420a498cac15a3c38d298765a948ddae5007c15c77fbc5aa6c65149c968ce20eb916024ddd4c6e47aeaae9b10d13e1d0b245089f04db2902b1eda643cbc",
        "95520901447cb29c4a8b0c6376e5a10d8a05cc2225e0a64789ce917e27db891cd9c1aa3cd27869941ef797492fab2e3dd903db8100e57e0842577cfb35f45848",
        "7141c96de6ca4e94f407b1b4803f32fe72322213d94310445b69c11be913d6ceb3777e04e19ab8ff76c12260e6705035311e673b68b0763ebff2a3d67a06f90d",
        "3b84ce0a89a50a01299cf4582fd0ed164a8cb24289ac3a4afc3a652e9aacad0a9e17caa2c787cd3cd6a3e7a79a31f2f2c4f6f54a58ae1c53d03226134070f5b9"
	},
	owners = {
		"66ed442039083616d035cd09a9701e6c225bd61278aaad11a759956172144867ed1b0dc1ecc4f779e6084d7d576e49250f8066e2f9ad86340185939a7e79b30f",
        "55273f4b0931f16c1677680328f2784842114d212498a657a79bb5086b3929c173c5e3ca5b41fa3301b62cccf1b241db68a85e3cd9bbe5545b7a8c6422e7f0d2",
        "389b0e57c452ceb5e7c71fa20a75fd11147cef40adef9935f10abf5982d21e2ff01b7357f22855b5ea6536d4b841a337c0e52cfb614049bf47b175addc4f905e"
	},
	chattags = {
		["55273f4b0931f16c1677680328f2784842114d212498a657a79bb5086b3929c173c5e3ca5b41fa3301b62cccf1b241db68a85e3cd9bbe5545b7a8c6422e7f0d2"] = {
			NameColor = {r = 255, g = 0, b = 0},
			Tags = {
				{
					TagColor = {r = 255, g = 0, b = 0},
					TagText = "okay"
				}
			}
		}
	}
}
pcall(function()
	whitelisted = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/whitelists/main/whitelist2.json", true))
end)

local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

--skidded off the devforum because I hate projectile math
-- Compute 2D launch angle
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- d: horizontal distance
-- h: vertical distance
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchAngle(v: number, g: number, d: number, h: number, higherArc: boolean)
	local v2 = v * v
	local v4 = v2 * v2
	local root = math.sqrt(v4 - g*(g*d*d + 2*h*v2))
	if not higherArc then root = -root end
	return math.atan((v2 + root) / (g * d))
end

-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
	-- get the direction flattened:
	local horizontal = Vector3.new(target.X - start.X, 0, target.Z - start.Z)
	
	local h = target.Y - start.Y
	local d = horizontal.Magnitude
	local a = LaunchAngle(v, g, d, h, higherArc)
	
	-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
	if a ~= a then return nil end
	
	-- speed if we were just launching at a flat angle:
	local vec = horizontal.Unit * v
	
	-- rotate around the axis perpendicular to that direction...
	local rotAxis = Vector3.new(-horizontal.Z, 0, horizontal.X)
	
	-- ...by the angle amount
	return CFrame.fromAxisAngle(rotAxis, a) * vec
end

local function FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: Number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: Number)
	local distance = (targetPosition - shooterPosition).Magnitude

	local p = targetPosition - shooterPosition
	local v = targetVelocity - shooterVelocity
	local a = Vector3.zero

	local timeTaken = (distance / projectileSpeed)
	
	if gravity > 0 then
		local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
	end

	local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
	local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
	local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2
	
	return Vector3.new(goalX, goalY, goalZ)
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function runcode(func)
	func()
end

runcode(function()
	local textlabel = Instance.new("TextLabel")
	textlabel.Size = UDim2.new(1, 0, 0, 36)
	textlabel.Text = "Moderators can ban you at any time, Always use alts."
	textlabel.BackgroundTransparency = 1
	textlabel.ZIndex = 10
	textlabel.TextStrokeTransparency = 0
	textlabel.TextScaled = true
	textlabel.Font = Enum.Font.SourceSans
	textlabel.TextColor3 = Color3.new(1, 1, 1)
	textlabel.Position = UDim2.new(0, 0, 0, -36)
	textlabel.Parent = GuiLibrary["MainGui"].ScaledGui.ClickGui
	task.spawn(function()
		repeat task.wait() until matchState ~= 0
		textlabel:Remove()
	end)
end)

local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end

GuiLibrary["LoadSettingsEvent"].Event:connect(function(res)
	for i,v in pairs(res) do
		local obj = GuiLibrary["ObjectsThatCanBeSaved"][i]
		if obj and v["Type"] == "ItemList" and obj.Api then
			obj["Api"]["Hotbars"] = v["Items"]
			obj["Api"]["CurrentlySelected"] = v["CurrentlySelected"]
			obj["Api"]["RefreshList"]()
		end
	end
end)

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
end

local function getItemNear(itemName, inv)
	for i5, v5 in pairs(inv or currentinventory.inventory.items) do
		if v5.itemType:find(itemName) then
			return v5, i5
		end
	end
	return nil
end

local function getItem(itemName, inv)
	for i5, v5 in pairs(inv or currentinventory.inventory.items) do
		if v5.itemType == itemName then
			return v5, i5
		end
	end
	return nil
end

local function getHotbarSlot(itemName)
	for i5, v5 in pairs(currentinventory.hotbar) do
		if v5["item"] and v5["item"].itemType == itemName then
			return i5 - 1
		end
	end
	return nil
end

local function getSword()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if bedwars["ItemTable"][v5.itemType]["sword"] then
			local swordrank = bedwars["ItemTable"][v5.itemType]["sword"]["damage"] or 0
			if swordrank > bestswordnum then
				bestswordnum = swordrank
				bestswordslot = i5
				bestsword = v5
			end
		end
	end
	return bestsword, bestswordslot
end

local function getSlotFromItem(item)
	for i,v in pairs(currentinventory.inventory.items) do
		if v.itemType == item.itemType then
			return i
		end
	end
	return nil
end

local function getAxe()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if v5.itemType:find("axe") and v5.itemType:find("pickaxe") == nil and v5.itemType:find("void") == nil then
			bestswordnum = swordrank
			bestswordslot = i5
			bestsword = v5
		end
	end
	return bestsword, bestswordslot
end

local function getPickaxe()
	return getItemNear("pick")
end

local function getBaguette()
	return getItemNear("baguette")
end

local function getwool()
	local wool = getItemNear("wool")
	return wool and wool.itemType, wool and wool.amount
end

local function isAliveOld(plr, alivecheck)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return entity.isAlive
end

local function isAlive(plr, alivecheck)
	if plr then
		local ind, tab = entity.getEntityFromPlayer(plr)
		return ((not alivecheck) or tab and tab.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead) and tab
	end
	return entity.isAlive
end

local function hashvec(vec)
	return {
		["value"] = vec
	}
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj or type(v) == "table" and v.hash == obj then
			return v
		end
	end
	return nil
end

local GetNearestHumanoidToMouse = function() end

local function randomString()
	local randomlength = math.random(10,100)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetChildren()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and bedwars["CheckWhitelisted"](v) then
			return true
		end
	end
	return false
end

local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        bedwars = {
			["AnimationType"] = require(repstorage.TS.animation["animation-type"]).AnimationType,
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
			["BedTable"] = {},
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["CannonRemote"] = getremote(debug.getconstants(KnitClient.Controllers.CannonHandController.fireCannon)),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["CheckWhitelisted"] = function(plr, ownercheck)
				local plrstr = bedwars["HashFunction"](plr.Name..plr.UserId)
				local localstr = bedwars["HashFunction"](lplr.Name..lplr.UserId)
				return ((ownercheck == nil and (betterfind(whitelisted.players, plrstr) or betterfind(whitelisted.owners, plrstr)) or ownercheck and betterfind(whitelisted.owners, plrstr))) and betterfind(whitelisted.owners, localstr) == nil and true or false
			end,
			["CheckPlayerType"] = function(plr)
				local plrstr = bedwars["HashFunction"](plr.Name..plr.UserId)
				local playertype, playerattackable = "DEFAULT", true
				local private = betterfind(whitelisted.players, plrstr)
				local owner = betterfind(whitelisted.owners, plrstr)
				if private then
					playertype = "VAPE PRIVATE"
					playerattackable = not (type(private) == "table" and private.invulnerable or false)
				end
				if game.Players.LocalPlayer.UserId == 3861669503 then
					playertype = "VAPE OWNER"
					playerattackable = not (type(owner) == "table" and owner.invulnerable or false)
				end
				return playertype, playerattackable
			end,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
            ["getInventory"] = function(plr)
                local suc, result = pcall(function() 
					if plr == lplr then 
						return currentinventory.inventory
					end
					return inventories[plr]
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HashFunction"] = function(str)
				if storedshahashes[tostring(str)] == nil then
					storedshahashes[tostring(str)] = shalib.sha512(tostring(str).."SelfReport")
				end
				return storedshahashes[tostring(str)]
			end,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["IsVapePrivateIngame"] = function()
				for i,v in pairs(players:GetChildren()) do 
					local plrstr = bedwars["HashFunction"](v.Name..v.UserId)
					if bedwars["CheckPlayerType"](v) ~= "DEFAULT" or whitelisted.chattags[plrstr] then 
						return true
					end
				end
				return false
			end,
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["KnockbackTable2"] = require(repstorage.TS.damage["knockback-util"]).KnockbackUtil,
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
			["PirateRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PirateFlagController.checkForPickUp)),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
		blocktable = bedwars["BlockController2"].new(bedwars["BlockEngine"], getwool())
		bedwars["placeBlock"] = function(newpos, customblock)
			if getItem(customblock) then
				blocktable.blockType = customblock
				return blocktable:placeBlock(Vector3.new(newpos.X / 3, newpos.Y / 3, newpos.Z / 3))
			end
		end
        task.spawn(function()
            repeat task.wait() until matchState ~= 0
			if (not uninjectflag) then
				bedwarsblocks = collectionservice:GetTagged("block")
				connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceAddedSignal("block"):Connect(function(v) table.insert(bedwarsblocks, v) blockraycast.FilterDescendantsInstances = bedwarsblocks end)
				connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceRemovedSignal("block"):Connect(function(v) local found = table.find(bedwarsblocks, v) if found then table.remove(bedwarsblocks, found) end blockraycast.FilterDescendantsInstances = bedwarsblocks end)
				blockraycast.FilterDescendantsInstances = bedwarsblocks
				local lowestypos = 99999
				for i,v in pairs(bedwarsblocks) do 
					local newray = workspace:Raycast(v.Position + vec3(0, 800, 0), vec3(0, -1000, 0), blockraycast)
					if i % 200 == 0 then 
						task.wait(0.06)
					end
					if newray and newray.Position.Y <= lowestypos then
						lowestypos = newray.Position.Y
					end
				end
				antivoidypos = lowestypos - 8
			end
        end)
		connectionstodisconnect[#connectionstodisconnect + 1] = bedwars["ClientStoreHandler"].changed:connect(function(p3, p4)
			if p3.Game ~= p4.Game then 
				matchState = p3.Game.matchState
				queueType = p3.Game.queueType or "bedwars_test"
			end
			if p3.Kit ~= p4.Kit then 	
				bedwars["BountyHunterTarget"] = p3.Kit.bountyHunterTarget
			end
			if p3.Bedwars ~= p4.Bedwars then 
				kit = p3.Bedwars.kit
			end
			if p3.Inventory ~= p4.Inventory then 
				currentinventory = p3.Inventory.observedInventory
			end
        end)
		local clientstorestate = bedwars["ClientStoreHandler"]:getState()
        matchState = clientstorestate.Game.matchState or 0
        kit = clientstorestate.Bedwars.kit or ""
		queueType = clientstorestate.Game.queueType or "bedwars_test"
		currentinventory = clientstorestate.Inventory.observedInventory
		if not shared.vapebypassed then
			local fakeremote = Instance.new("RemoteEvent")
			fakeremote.Name = "GameAnalyticsError"
			local realremote = repstorage:WaitForChild("GameAnalyticsError")
			realremote.Parent = nil
			fakeremote.Parent = repstorage
			game:GetService("ScriptContext").Error:Connect(function(p1, p2, p3)
				if not p3 then
					return;
				end;
				local u2 = nil;
				local v4, v5 = pcall(function()
					u2 = p3:GetFullName();
				end);
				if not v4 then
					return;
				end;
				if p3.Parent == nil then
					return;
				end
				realremote:FireServer(p1, p2, u2);
			end)
			shared.vapebypassed = true
		end

		task.spawn(function()
			local chatsuc, chatres = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile("vape/Profiles/bedwarssettings.json")) end)
			if chatsuc then
				if chatres.crashed and (not chatres.said) then
					pcall(function()
						local notification1 = createwarning("Vape", "either ur poor or its a exploit moment", 10)
						notification1:GetChildren()[5].TextSize = 15
						local notification2 = createwarning("Vape", "getconnections crashed, chat hook not loaded.", 10)
						notification2:GetChildren()[5].TextSize = 13
					end)
					local jsondata = game:GetService("HttpService"):JSONEncode({
						crashed = true,
						said = true,
					})
					writefile("vape/Profiles/bedwarssettings.json", jsondata)
				end
				if chatres.crashed then
					return nil
				else
					local jsondata = game:GetService("HttpService"):JSONEncode({
						crashed = true,
						said = false,
					})
					writefile("vape/Profiles/bedwarssettings.json", jsondata)
				end
			else
				local jsondata = game:GetService("HttpService"):JSONEncode({
					crashed = true,
					said = false,
				})
				writefile("vape/Profiles/bedwarssettings.json", jsondata)
			end
			repeat task.wait() until WhitelistFunctions.Loaded
			for i3,v3 in pairs(WhitelistFunctions.WhitelistTable.chattags) do
				if v3.NameColor then
					v3.NameColor = Color3.fromRGB(v3.NameColor.r, v3.NameColor.g, v3.NameColor.b)
				end
				if v3.ChatColor then
					v3.ChatColor = Color3.fromRGB(v3.ChatColor.r, v3.ChatColor.g, v3.ChatColor.b)
				end
				if v3.Tags then
					for i4,v4 in pairs(v3.Tags) do
						if v4.TagColor then
							v4.TagColor = Color3.fromRGB(v4.TagColor.r, v4.TagColor.g, v4.TagColor.b)
						end
					end
				end
			end
			if getconnections then 
				for i,v in pairs(getconnections(repstorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
					if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
						oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
						oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
						getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
							local tab = oldchannelfunc(Self, Name)
							if tab and tab.AddMessageToChannel then
								local addmessage = tab.AddMessageToChannel
								if oldchanneltabs[tab] == nil then
									oldchanneltabs[tab] = tab.AddMessageToChannel
								end
								tab.AddMessageToChannel = function(Self2, MessageData)
									if MessageData.FromSpeaker and players[MessageData.FromSpeaker] then
										if plrtype == "VAPE PRIVATE" then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(0.7, 0, 1),
														TagText = "VAPE PRIVATE"
													}
												}
											}
										end
										if plrtype == "VAPE OWNER" then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(1, 0, 0) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(1, 0.3, 0.3),
														TagText = "VAPE OWNER"
													}
												}
											}
										end
										if clients.ClientUsers[tostring(players[MessageData.FromSpeaker])] then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(1, 0, 0) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(1, 1, 0),
														TagText = clients.ClientUsers[tostring(players[MessageData.FromSpeaker])]
													}
												}
											}
										end
										if WhitelistFunctions.WhitelistTable.chattags[hash] then
											local newdata = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and WhitelistFunctions.WhitelistTable.chattags[hash].NameColor or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = WhitelistFunctions.WhitelistTable.chattags[hash].Tags
											}
											MessageData.ExtraData = newdata
										end
									end
									return addmessage(Self2, MessageData)
								end
							end
							return tab
						end
					end
				end
			end
			local jsondata = game:GetService("HttpService"):JSONEncode({
				crashed = false,
				said = false,
			})
			writefile("vape/Profiles/bedwarssettings.json", jsondata)
		end)
    end
end)

local fakeuiconnection
GuiLibrary["SelfDestructEvent"].Event:Connect(function()
	if OldClientGet then
		getmetatable(bedwars["ClientHandler"]).Get = OldClientGet
	end
	uninjectflag = true
	if blocktable then blocktable:disable() end
	if teleportfunc then teleportfunc:Disconnect() end
	if chatconnection then chatconnection:Disconnect() end
	if chatconnection2 then chatconnection2:Disconnect() end
	if fakeuiconnection then fakeuiconnection:Disconnect() end
	if oldchannelfunc and oldchanneltab then oldchanneltab.GetChannel = oldchannelfunc end
	for i2,v2 in pairs(oldchanneltabs) do i2.AddMessageToChannel = v2 end
	for i3,v3 in pairs(connectionstodisconnect) do
		if v3.Disconnect then pcall(function() v3:Disconnect() end) end
	end
end)

chatconnection2 = lplr.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(text)
	local textlabel2 = text:WaitForChild("TextLabel")
	if WhitelistFunctions:IsSpecialIngame() then
		local args = textlabel2.Text:split(" ")
		local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
		if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
			text.Size = UDim2.new(0, 0, 0, 0)
			text:GetPropertyChangedSignal("Size"):Connect(function()
				text.Size = UDim2.new(0, 0, 0, 0)
			end)
		end
		if client then
			if textlabel2.Text:find(clients.ChatStrings2[client]) then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
		end
		textlabel2:GetPropertyChangedSignal("Text"):Connect(function()
			local args = textlabel2.Text:split(" ")
			local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
			if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
			if client then
				if textlabel2.Text:find(clients.ChatStrings2[client]) then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
			end
		end)
	end
end)

teleportfunc = lplr.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
		local clientstorestate = bedwars["ClientStoreHandler"]:getState()
		local queuedstring = ''
		if clientstorestate.Party and clientstorestate.Party.members and #clientstorestate.Party.members > 0 then
        	queuedstring = queuedstring..'shared.vapeteammembers = '..#clientstorestate.Party.members..'\n'
		end
		if tpstring then
			queuedstring = queuedstring..'shared.vapeoverlay = "'..tpstring..'"\n'
		end
		queueteleport(queuedstring)
    end
end)

local function getblock(pos)
	local blockpos = bedwars["BlockController"]:getBlockPosition(pos)
	return bedwars["BlockController"]:getStore():getBlockAt(blockpos), blockpos
end

getfunctions()

local function getNametagString(plr)
	local nametag = ""
	local hash = WhitelistFunctions:Hash(plr.Name..plr.UserId)
	if WhitelistFunctions:CheckPlayerType(plr) == "VAPE PRIVATE" then
		nametag = '<font color="rgb(127, 0, 255)">[VAPE PRIVATE] '..(plr.Name)..'</font>'
	end
	if WhitelistFunctions:CheckPlayerType(plr) == "VAPE OWNER" then
		nametag = '<font color="rgb(255, 80, 80)">[VAPE OWNER] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if clients.ClientUsers[tostring(plr)] then
		nametag = '<font color="rgb(255, 255, 0)">['..clients.ClientUsers[tostring(plr)]..'] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if WhitelistFunctions.WhitelistTable.chattags[hash] then
		local data = WhitelistFunctions.WhitelistTable.chattags[hash]
		local newnametag = ""
		if data.Tags then
			for i2,v2 in pairs(data.Tags) do
				newnametag = newnametag..'<font color="rgb('..math.floor(v2.TagColor.r * 255)..', '..math.floor(v2.TagColor.g * 255)..', '..math.floor(v2.TagColor.b * 255)..')">['..v2.TagText..']</font> '
			end
		end
		nametag = newnametag..(newnametag.NameColor and '<font color="rgb('..math.floor(newnametag.NameColor.r * 255)..', '..math.floor(newnametag.NameColor.g * 255)..', '..math.floor(newnametag.NameColor.b * 255)..')">' or '')..(plr.DisplayName or plr.Name)..(newnametag.NameColor and '</font>' or '')
	end
	return nametag
end

local function Cape(char, texture)
	for i,v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
	local hum = char:WaitForChild("Humanoid")
	local torso = nil
	if hum.RigType == Enum.HumanoidRigType.R15 then
	torso = char:WaitForChild("UpperTorso")
	else
	torso = char:WaitForChild("Torso")
	end
	local p = Instance.new("Part", torso.Parent)
	p.Name = "Cape"
	p.Anchored = false
	p.CanCollide = false
	p.TopSurface = 0
	p.BottomSurface = 0
	p.FormFactor = "Custom"
	p.Size = vec3(0.2,0.2,0.2)
	p.Transparency = 1
	local decal = Instance.new("Decal", p)
	decal.Texture = texture
	decal.Face = "Back"
	local msh = Instance.new("BlockMesh", p)
	msh.Scale = vec3(9,17.5,0.5)
	local motor = Instance.new("Motor", p)
	motor.Part0 = p
	motor.Part1 = torso
	motor.MaxVelocity = 0.01
	motor.C0 = cfnew(0,2,0) * CFrame.Angles(0,math.rad(90),0)
	motor.C1 = cfnew(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
	local wave = false
	repeat wait(1/44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
	until not p or p.Parent ~= torso.Parent
end

local function getSpeedMultiplier(reduce)
	local speed = 1
	if lplr.Character then 
		local speedboost = lplr.Character:GetAttribute("SpeedBoost")
		if speedboost and speedboost > 1 then 
			speed = speed + (speedboost - 1)
		end
		if lplr.Character:GetAttribute("GrimReaperChannel") then 
			speed = speed + 0.6
		end
		if lplr.Character:GetAttribute("SpeedPieBuff") then 
			speed = speed + (queueType == "SURVIVAL" and 0.15 or 0.3)
		end
		local armor = currentinventory.inventory.armor[3]
		if type(armor) ~= "table" then armor = {itemType = ""} end
		if armor.itemType == "speed_boots" then 
			speed = speed + 1
		end
	end
	return reduce and speed ~= 1 and speed * (0.85 - (0.15 * math.floor(speed))) or speed
end

runcode(function()
	local function disguisechar(char, id)
		task.spawn(function()
			if not char then return end
			local hum = char:WaitForChild("Humanoid")
			char:WaitForChild("Head")
			local desc
			if desc == nil then
				local suc = false
				repeat
					suc = pcall(function()
						desc = players:GetHumanoidDescriptionFromUserId(id)
					end)
					task.wait(1)
				until suc
			end
			desc.HeightScale = hum:WaitForChild("HumanoidDescription").HeightScale
			char.Archivable = true
			local disguiseclone = char:Clone()
			disguiseclone.Name = "disguisechar"
			disguiseclone.Parent = workspace
			for i,v in pairs(disguiseclone:GetChildren()) do 
				if v:IsA("Accessory") or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") then  
					v:Destroy()
				end
			end
			disguiseclone.Humanoid:ApplyDescriptionClientServer(desc)
			for i,v in pairs(char:GetChildren()) do 
				if (v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then 
					v.Parent = game
				end
			end
			char.ChildAdded:Connect(function(v)
				if ((v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors")) and v:GetAttribute("Disguise") == nil then 
					repeat task.wait() v.Parent = game until v.Parent == game
				end
			end)
			for i,v in pairs(disguiseclone:WaitForChild("Animate"):GetChildren()) do 
				v:SetAttribute("Disguise", true)
				local real = char.Animate:FindFirstChild(v.Name)
				if v:IsA("StringValue") and real then 
					real.Parent = game
					v.Parent = char.Animate
				end
			end
			for i,v in pairs(disguiseclone:GetChildren()) do 
				v:SetAttribute("Disguise", true)
				if v:IsA("Accessory") then  
					for i2,v2 in pairs(v:GetDescendants()) do 
						if v2:IsA("Weld") and v2.Part1 then 
							v2.Part1 = char[v2.Part1.Name]
						end
					end
					v.Parent = char
				elseif v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then  
					v.Parent = char
				elseif v.Name == "Head" then 
					char.Head.MeshId = v.MeshId
				end
			end
			local localface = char:FindFirstChild("face", true)
			local cloneface = disguiseclone:FindFirstChild("face", true)
			if localface and cloneface then localface.Parent = game cloneface.Parent = char.Head end
			char.Humanoid.HumanoidDescription:SetEmotes(desc:GetEmotes())
			char.Humanoid.HumanoidDescription:SetEquippedEmotes(desc:GetEquippedEmotes())
			disguiseclone:Destroy()
		end)
	end

	local function renderNametag(plr)
		if (WhitelistFunctions:CheckPlayerType(plr) ~= "DEFAULT" or WhitelistFunctions.WhitelistTable.chattags[WhitelistFunctions:Hash(plr.Name..plr.UserId)]) then
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end
				end)
			end
			if lplr ~= plr and WhitelistFunctions:CheckPlayerType(lplr) == "DEFAULT" then
				task.spawn(function()
					repeat task.wait() until plr:GetAttribute("PlayerConnected")
					task.wait(4)
					repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." "..clients.ChatStrings2.vape, "All")
					task.spawn(function()
						local connection
						for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
							if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2.vape) then
								newbubble.Parent.Parent.Visible = false
								repeat task.wait() until newbubble:IsDescendantOf(nil) 
								if connection then
									connection:Disconnect()
								end
							end
						end
						connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
							if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2.vape) then
								newbubble.Parent.Parent.Visible = false
								repeat task.wait() until newbubble:IsDescendantOf(nil)
								if connection then
									connection:Disconnect()
								end
							end
						end)
					end)
					repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
					task.wait(0.2)
					if getconnections then
						for i,v in pairs(getconnections(repstorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
							if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
								debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("all")
							end
						end
					end
				end)
			end
			local nametag = getNametagString(plr)
			local function charfunc(char)
				if char then
					task.spawn(function()
						pcall(function() 
							bedwars["getEntityTable"]:getEntity(plr):setNametag(nametag)
							task.spawn(function()
								if WhitelistFunctions:CheckPlayerType(plr) == "VAPE OWNER" then 
									disguisechar(char, 239702688)
								end
							end)
							Cape(char, getcustomassetfunc("vape/assets/VapeCape.png"))
						end)
					end)
				end
			end

			--[[plr:GetPropertyChangedSignal("Team"):Connect(function()
				task.delay(3, function()
					pcall(function()
						bedwars["getEntityTable"]:getEntity(plr):setNametag(nametag)
					end)
				end)
			end)]]

			charfunc(plr.Character)
			connectionstodisconnect[#connectionstodisconnect + 1] = plr.CharacterAdded:Connect(charfunc)
		end
	end

	task.spawn(function()
		repeat task.wait() until WhitelistFunctions.Loaded
		for i,v in pairs(players:GetChildren()) do renderNametag(v) end
		connectionstodisconnect[#connectionstodisconnect + 1] = players.PlayerAdded:Connect(renderNametag)
	end)
end)

local function friendCheck(plr, recolor)
	if GuiLibrary["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] then
		local friend = (table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name) and GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectListEnabled"][table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name)] and true or nil)
		if recolor then
			return (friend and GuiLibrary["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] and true or nil)
		else
			return friend
		end
	end
	return nil
end

local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
end

local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end

do
	entity.selfDestruct()
	entity.isPlayerTargetable = function(plr)
		return lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") and friendCheck(plr) == nil
	end
	entity.characterAdded = function(plr, char, localcheck)
        if char then
            task.spawn(function()
				local id = game:GetService("HttpService"):GenerateGUID(true)
                entity.entityIds[plr.Name] = id
                local humrootpart = char:WaitForChild("HumanoidRootPart", 10)
                local head = char:WaitForChild("Head", 10)
                local hum = char:WaitForChild("Humanoid", 10)
				if entity.entityIds[plr.Name] ~= id then return end
                if humrootpart and hum and head then
					local childremoved
                    local newent
                    if localcheck then
                        entity.isAlive = true
                        entity.character.Head = head
                        entity.character.Humanoid = hum
                        entity.character.HumanoidRootPart = humrootpart
                    else
						newent = {
                            Player = plr,
                            Character = char,
                            HumanoidRootPart = humrootpart,
                            RootPart = humrootpart,
                            Head = head,
                            Humanoid = hum,
                            Targetable = entity.isPlayerTargetable(plr),
                            Team = plr.Team,
                            Connections = {}
                        }
						local inv = char:WaitForChild("InventoryFolder", 5)
						if inv then 
							local armorobj1 = char:WaitForChild("ArmorInvItem_0", 5)
							local armorobj2 = char:WaitForChild("ArmorInvItem_1", 5)
							local armorobj3 = char:WaitForChild("ArmorInvItem_2", 5)
							local handobj = char:WaitForChild("HandInvItem", 5)
							if entity.entityIds[plr.Name] ~= id then return end
							if armorobj1 then
								table.insert(newent.Connections, armorobj1.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if armorobj2 then
								table.insert(newent.Connections, armorobj2.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if armorobj3 then
								table.insert(newent.Connections, armorobj3.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if handobj then
								table.insert(newent.Connections, handobj.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr)
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
						end
						task.delay(0.3, function() 
							inventories[plr] = bedwars["getInventory2"](plr) 
							entity.entityUpdatedEvent:Fire(newent)
						end)
						table.insert(newent.Connections, hum:GetPropertyChangedSignal("Health"):Connect(function() entity.entityUpdatedEvent:Fire(newent) end))
						table.insert(newent.Connections, hum:GetPropertyChangedSignal("MaxHealth"):Connect(function() entity.entityUpdatedEvent:Fire(newent) end))
						table.insert(newent.Connections, char.AttributeChanged:Connect(function(attr) if attr:find("Shield") then entity.entityUpdatedEvent:Fire(newent) end end))
                        table.insert(entity.entityList, newent)
						entity.entityAddedEvent:Fire(newent)
                    end
					childremoved = char.ChildRemoved:Connect(function(part)
                        if part.Name == "HumanoidRootPart" or part.Name == "Head" or part.Name == "Humanoid" then
                            childremoved:Disconnect()
                            if localcheck then
                                if char == lplr.Character then
									if part.Name == "HumanoidRootPart" then
										entity.isAlive = false
										local root = char:FindFirstChild("HumanoidRootPart")
										if not root then 
											for i = 1, 30 do 
												task.wait(0.1)
												root = char:FindFirstChild("HumanoidRootPart")
												if root then break end
											end
										end
										if root then 
											entity.character.HumanoidRootPart = root
											entity.isAlive = true
										end
									else
										entity.isAlive = false
									end
								end
                            else
                                entity.removeEntity(plr)
                            end
                        end
                    end)
                    if newent then 
                        table.insert(newent.Connections, childremoved)
                    end
                    table.insert(entity.entityConnections, childremoved)
                end
            end)
        end
    end
	entity.entityAdded = function(plr, localcheck, custom)
       	table.insert(entity.entityConnections, plr.CharacterAdded:Connect(function(char)
            entity.refreshEntity(plr, localcheck)
        end))
        table.insert(entity.entityConnections, plr.CharacterRemoving:Connect(function(char)
            if localcheck then
                entity.isAlive = false
            else
                entity.removeEntity(plr)
            end
        end))
        table.insert(entity.entityConnections, plr:GetAttributeChangedSignal("Team"):Connect(function()
            if localcheck then
                entity.fullEntityRefresh()
            else
				entity.refreshEntity(plr, localcheck)
				local entnum, newent = entity.getEntityFromPlayer(plr)
				if newent then entity.entityUpdatedEvent:Fire(newent) end
				if plr:GetAttribute("Team") == lplr:GetAttribute("Team") then 
					task.delay(3, function()
						entity.refreshEntity(plr, localcheck)
						entnum, newent = entity.getEntityFromPlayer(plr)
						if newent then entity.entityUpdatedEvent:Fire(newent) end
					end)
				end
            end
        end))
		task.spawn(function()
            if not plr.Character then
                for i = 1, 10 do 
                    task.wait(0.1)
                    if plr.Character then break end
                end
            end
            if plr.Character then
                entity.refreshEntity(plr, localcheck)
            end
        end)
    end
	entity.fullEntityRefresh()
end

local function switchItem(tool, legit)
	if legit then
		local hotbarslot = getHotbarSlot(tool.Name)
		if hotbarslot then 
			bedwars["ClientStoreHandler"]:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = hotbarslot
			})
		end
	end
	pcall(function()
		lplr.Character.HandInvItem.Value = tool
	end)
	bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"]):CallServerAsync({
		hand = tool
	})
end

local updateitem = Instance.new("BindableEvent")
runcode(function()
	local inputobj = nil
	local tempconnection
	tempconnection = uis.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			inputobj = input
			tempconnection:Disconnect()
		end
	end)
	connectionstodisconnect[#connectionstodisconnect + 1] = updateitem.Event:Connect(function(inputObj)
		if uis:IsMouseButtonPressed(0) then
			game:GetService("ContextActionService"):CallFunction("block-break", Enum.UserInputState.Begin, inputobj)
		end
	end)
end)

local function getBestTool(block)
    local tool = nil
	local blockmeta = bedwars["ItemTable"][block]
	local blockType = blockmeta["block"] and blockmeta["block"]["breakType"]
	if blockType then
		for i,v in pairs(currentinventory.inventory.items) do
			local meta = bedwars["ItemTable"][v.itemType]
			if meta["breakBlock"] and meta["breakBlock"][blockType] then
				tool = v
				break
			end
		end
	end
    return tool
end

local function switchToAndUseTool(block, legit)
	local tool = getBestTool(block.Name)
	if tool and (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value ~= tool["tool"]) then
		if legit then
			if getHotbarSlot(tool.itemType) then
				bedwars["ClientStoreHandler"]:dispatch({
					type = "InventorySelectHotbarSlot", 
					slot = getHotbarSlot(tool.itemType)
				})
				task.wait(0.1)
				updateitem:Fire(inputobj)
				return true
			else
				return false
			end
		end
		switchItem(tool["tool"])
		task.wait(0.1)
	end
end

local normalsides = {}
for i,v in pairs(Enum.NormalId:GetEnumItems()) do if v.Name ~= "Bottom" then table.insert(normalsides, v) end end

local function isBlockCovered(pos)
	local coveredsides = 0
	for i, v in pairs(normalsides) do
		local blockpos = (pos + (Vector3.FromNormalId(v) * 3))
		local block = getblock(blockpos)
		if block then
			coveredsides = coveredsides + 1
		end
	end
	return coveredsides == #normalsides
end

local blacklistedblocks = {
	bed = true,
	ceramic = true
}
local function getallblocks(pos, normal)
	local blocks = {}
	local lastfound = nil
	for i = 1, 20 do
		local blockpos = (pos + (Vector3.FromNormalId(normal) * (i * 3)))
		local extrablock = getblock(blockpos)
		local covered = isBlockCovered(blockpos)
		if extrablock then
			if bedwars["BlockController"]:isBlockBreakable({blockPosition = blockpos}, lplr) and (not blacklistedblocks[extrablock.Name]) then
				table.insert(blocks, extrablock.Name)
			end
			lastfound = extrablock
			if not covered then
				break
			end
		else
			break
		end
	end
	return blocks
end

local function getlastblock(pos, normal)
	local lastfound, lastpos = nil, nil
	for i = 1, 20 do
		local blockpos = (pos + (Vector3.FromNormalId(normal) * (i * 3)))
		local extrablock, extrablockpos = getblock(blockpos)
		local covered = isBlockCovered(blockpos)
		if extrablock then
			lastfound, lastpos = extrablock, extrablockpos
			if not covered then
				break
			end
		else
			break
		end
	end
	return lastfound, lastpos
end

local healthbarblocktable = {
	["blockHealth"] = -1,
	["breakingBlockPosition"] = Vector3.zero
}
bedwars["breakBlock"] = function(pos, effects, normal, bypass)
    if lplr:GetAttribute("DenyBlockBreak") == true then
		return nil
	end
	local block, blockpos = nil, nil
	if not bypass then block, blockpos = getlastblock(pos, normal) end
	if not block then block, blockpos = getblock(pos) end
    if blockpos and block then
        if bedwars["BlockEngineClientEvents"].DamageBlock:fire(block.Name, blockpos, block):isCancelled() then
            return nil
        end
        local blockhealthbarpos = {blockPosition = Vector3.zero}
        local blockdmg = 0
        if block and block.Parent ~= nil then
            switchToAndUseTool(block)
            blockhealthbarpos = {
                blockPosition = blockpos
            }
            if healthbarblocktable.blockHealth == -1 or blockhealthbarpos.blockPosition ~= healthbarblocktable.breakingBlockPosition then
				local blockdata = bedwars["BlockController"]:getStore():getBlockData(blockhealthbarpos.blockPosition)
				local blockhealth = blockdata and blockdata:GetAttribute(lplr.Name .. "_Health") or block:GetAttribute("Health")
				healthbarblocktable.blockHealth = blockhealth
				healthbarblocktable.breakingBlockPosition = blockhealthbarpos.blockPosition
			end
            blockdmg = bedwars["BlockController"]:calculateBlockDamage(lplr, blockhealthbarpos)
            bedwars["ClientHandlerDamageBlock"]:Get("DamageBlock"):CallServerAsync({
                blockRef = blockhealthbarpos, 
                hitPosition = blockpos * 3, 
                hitNormal = Vector3.FromNormalId(normal)
            }):andThen(function(result)
				if result ~= "failed" then
					healthbarblocktable.blockHealth = math.max(healthbarblocktable.blockHealth - blockdmg, 0)
					if effects then
						bedwars["BlockBreaker"]:updateHealthbar(blockhealthbarpos, healthbarblocktable.blockHealth, block:GetAttribute("MaxHealth"), blockdmg)
						if healthbarblocktable.blockHealth <= 0 then
							bedwars["BlockBreaker"].breakEffect:playBreak(block.Name, blockhealthbarpos.blockPosition, lplr)
							bedwars["BlockBreaker"].healthbarMaid:DoCleaning()
							healthbarblocktable.breakingBlockPosition = Vector3.zero
						else
							bedwars["BlockBreaker"].breakEffect:playHit(block.Name, blockhealthbarpos.blockPosition, lplr)
						end
					end
				end
			end)
        end
    end
end	

local function getEquipped()
	local typetext = ""
	local obj = currentinventory.inventory.hand
	if obj then
		local metatab = bedwars["ItemTable"][obj.itemType]
		typetext = metatab.sword and "sword" or metatab.block and "block" or obj.itemType:find("bow") and "bow"
	end
    return {["Object"] = obj and obj.tool, ["Type"] = typetext}
end

local function GetAllNearestHumanoidToPosition(player, distance, amount, targetcheck, overridepos, sortfunc)
	local returnedplayer = {}
	local currentamount = 0
    if entity.isAlive then -- alive check
        for i, v in pairs(entity.entityList) do -- loop through players
            if (v.Targetable or targetcheck) and targetCheck(v) then -- checks
                local mag = (entity.character.HumanoidRootPart.Position - v.RootPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v.RootPart.Position).magnitude
				end
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
		for i2,v2 in pairs(collectionservice:GetTagged("Monster")) do -- monsters
			if v2.PrimaryPart and currentamount < amount and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (entity.character.HumanoidRootPart.Position - v2.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v2.PrimaryPart.Position).magnitude
				end
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2, RootPart = v2.PrimaryPart}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
                end
			end
		end
		for i3,v3 in pairs(collectionservice:GetTagged("Drone")) do -- drone
			if v3.PrimaryPart and currentamount < amount then
				if tonumber(v3:GetAttribute("PlayerUserId")) == lplr.UserId then continue end
				local droneplr = players:GetPlayerByUserId(v3:GetAttribute("PlayerUserId"))
				if droneplr and droneplr.Team == lplr.Team then continue end
				local mag = (entity.character.HumanoidRootPart.Position - v3.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v3.PrimaryPart.Position).magnitude
				end
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Player = {Name = "Drone", UserId = 1443379645}, Character = v3, RootPart = v3.PrimaryPart}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
                end
			end
		end
		if currentamount > 0 and sortfunc then 
			table.sort(returnedplayer, sortfunc)
			returnedplayer = {returnedplayer[1]}
		end
	end
	return returnedplayer -- table of attackable entities
end

GetNearestHumanoidToMouse = function(player, distance, checkvis)
	local closest, returnedplayer = distance, nil
	if entity.isAlive then
		for i, v in pairs(entity.entityList) do
			if v.Targetable then
				local vec, vis = cam:WorldToScreenPoint(v.RootPart.Position)
				if vis and targetCheck(v) then
					local mag = (uis:GetMouseLocation() - Vector2.new(vec.X, vec.Y)).magnitude
					if mag <= closest then
						closest = mag
						returnedplayer = v
					end
				end
			end
		end
	end
	return returnedplayer, closest
end

local function GetNearestHumanoidToPosition(player, distance, overridepos)
	local closest, returnedplayer = distance, nil
    if entity.isAlive then
        for i, v in pairs(entity.entityList) do
			if v.Targetable and targetCheck(v) then
				local mag = (entity.character.HumanoidRootPart.Position - v.RootPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v.RootPart.Position).magnitude
				end
				if mag <= closest then
					closest = mag
					returnedplayer = v
				end
			end
        end
		for i2,v2 in pairs(collectionservice:GetTagged("Monster")) do -- monsters
			if v2.PrimaryPart and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (entity.character.HumanoidRootPart.Position - v2.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v2.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
                    closest = mag
					returnedplayer = {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2, RootPart = v2.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
		for i3,v3 in pairs(collectionservice:GetTagged("Drone")) do -- drone
			if v3.PrimaryPart then
				if tonumber(v3:GetAttribute("PlayerUserId")) == lplr.UserId then continue end
				local droneplr = players:GetPlayerByUserId(v3:GetAttribute("PlayerUserId"))
				if droneplr and droneplr.Team == lplr.Team then continue end
				local mag = (entity.character.HumanoidRootPart.Position - v3.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v3.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
					closest = mag
                    returnedplayer = {Player = {Name = "Drone", UserId = 1443379645}, Character = v3, RootPart = v3.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
	end
	return returnedplayer
end

runcode(function()
	local handsquare = Instance.new("ImageLabel")
	handsquare.Size = UDim2.new(0, 26, 0, 27)
	handsquare.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	handsquare.Position = UDim2.new(0, 72, 0, 39)
	handsquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local handround = Instance.new("UICorner")
	handround.CornerRadius = UDim.new(0, 4)
	handround.Parent = handsquare
	local helmetsquare = handsquare:Clone()
	helmetsquare.Position = UDim2.new(0, 100, 0, 39)
	helmetsquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local chestplatesquare = handsquare:Clone()
	chestplatesquare.Position = UDim2.new(0, 127, 0, 39)
	chestplatesquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local bootssquare = handsquare:Clone()
	bootssquare.Position = UDim2.new(0, 155, 0, 39)
	bootssquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local uselesssquare = handsquare:Clone()
	uselesssquare.Position = UDim2.new(0, 182, 0, 39)
	uselesssquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local oldupdate = targetinfo["UpdateInfo"]
	targetinfo["UpdateInfo"] = function(tab, targetsize)
		local bkgcheck = targetinfo["Object"].GetCustomChildren().Frame.MainInfo.BackgroundTransparency == 1
		handsquare.BackgroundTransparency = bkgcheck and 1 or 0
		helmetsquare.BackgroundTransparency = bkgcheck and 1 or 0
		chestplatesquare.BackgroundTransparency = bkgcheck and 1 or 0
		bootssquare.BackgroundTransparency = bkgcheck and 1 or 0
		uselesssquare.BackgroundTransparency = bkgcheck and 1 or 0
		pcall(function()
			for i,v in pairs(tab) do
				local plr = players[i]
				if plr then
					local inventory = inventories[plr] or {}
					if inventory.hand then
						handsquare.Image = bedwars["getIcon"](inventory.hand, true)
					else
						handsquare.Image = ""
					end
					if inventory.armor[4] then
						helmetsquare.Image = bedwars["getIcon"](inventory.armor[4], true)
					else
						helmetsquare.Image = ""
					end
					if inventory.armor[5] then
						chestplatesquare.Image = bedwars["getIcon"](inventory.armor[5], true)
					else
						chestplatesquare.Image = ""
					end
					if inventory.armor[6] then
						bootssquare.Image = bedwars["getIcon"](inventory.armor[6], true)
					else
						bootssquare.Image = ""
					end
				end
			end
		end)
		return oldupdate(tab, targetsize)
	end
end)

local function getBow()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if v5.itemType:find("bow") then 
			local tab = bedwars["ItemTable"][v5.itemType].projectileSource
			local ammo = tab.projectileType("arrow")	
			local dmg = bedwars["ProjectileMeta"][ammo].combat.damage
			if dmg > bestswordnum then
				bestswordnum = dmg
				bestswordslot = i5
				bestsword = v5
			end
		end
	end
	return bestsword, bestswordslot
end

local function getCustomItem(v2)
	local realitem = v2.itemType
	if realitem == "swords" then
		realitem = getSword() and getSword().itemType or "wood_sword"
	elseif realitem == "pickaxes" then
		realitem = getPickaxe() and getPickaxe().itemType or "wood_pickaxe"
	elseif realitem == "axes" then
		realitem = getAxe() and getAxe().itemType or "wood_axe"
	elseif realitem == "bows" then
		realitem = getBow() and getBow().itemType or "wood_bow"
	elseif realitem == "wool" then
		realitem = getwool() or "wool_white"
	end
	return realitem
end

local function findItemInTable(tab, item)
	for i,v in pairs(tab) do
		if v.itemType then
			local gottenitem, gottenitemnum = getItem(getCustomItem(v))
			if gottenitem and gottenitem.itemType == item.itemType then
				return i
			end
		end
	end
	return nil
end


local ScriptSettings = {}
local CustomFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "CustomFly",
	["Function"] = function(callback)
if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly"
})

local AnimDisabler = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"]  = "AnimDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})

local Shaders = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				createwarning("Shaders", "Unable to revert changes", 5)
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool shader"
})
local CollectGayDad
local CollectAllDrops = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"]  = "CollectAllDrops",
	["Function"] = function(callback)
		if callback then
                  CollectGayDad = true
			pcall(function()
				while task.wait() do
					if not CollectGayDad == true then return end
					for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
					end
				end
			end)
		else
		 CollectGayDad = false
		end
	end,
	["Default"] = false,
	["HoverText"] = "Collect drops"
})

local ItemExploit = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "ItemExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				createwarning("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits like 5 item settings settings"
})

local InfJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "InfiniteJump",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you can jump infinetly"
})


local HostCrasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "HostCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.HostCrasher = true
				for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                    local args = {
                        [1] = "",
                        [2] = {
                            [1] = {
                                ["userId"] = plr.UserId,
                                ["name"] = plr.Name,
                                ["displayName"] = plr.DisplayName
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:CohostPlayer"):FireServer(unpack(args))
				end
				while task.wait() do
				    if not ScriptSettings.HostCrasher == true then return end
				    for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {
                            [1] = "",
                            [2] = {
                                [1] = {
                                    ["userId"] = plr.UserId,
                                    ["name"] = plr.Name,
                                    ["displayName"] = plr.DisplayName
                                },
                                [2] = math.random(1,999999999)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:SetPlayerMaxHealth"):FireServer(unpack(args))
				    end
				end
			end)
		else
			pcall(function()
				ScriptSettings.HostCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Requires you to be host to let it work"
})

local Crosshair = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Crosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://9943168532"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://9943168532"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom crosshair"
})

local Night = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Night",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				game:GetService("Lighting").TimeOfDay = "00:00:00"
				while task.wait(5) do
					if not ScriptSettings.Night == true then return end
					game:GetService("Lighting").TimeOfDay = "00:00:00"
				end
			end)
		else
				game:GetService("Lighting").TimeOfDay = "13:00:00"
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool night render"
})

local ChatCrasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "ChatCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ChatCrasher = true
				while task.wait() do
					if not ScriptSettings.ChatCrasher == true then return end
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼", "All")
				end
			end)
		else
			pcall(function()
				ScriptSettings.ChatCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "cool"
})

local AntiAFK = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "AntiAFK",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AntiAFK = true
				local cons = getconnections or get_signal_cons
				if cons then
					for i,v in pairs(cons(game:GetService("Players").LocalPlayer.Idled)) do
						if ScriptSettings.AntiAFK == true then
							v:Disable()
							v:Disconnect()
						end
					end
				end
				assert(firesignal, "Asserted FireSignal")
				local uis = game:GetService("UserInputService")
				local runs = game:GetService("RUnService")
				uis.WindowFocusReleased:Connect(function()
					if ScriptSettings.AntiAFK == true then
						runs.Stepped:Wait()
						pcall(firesignal, uis.WindowFocused)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.AntiAFK = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "No more AFK kicks, wow, another untoggable module i made toggable"
})

local AutoWin = {["Enabled"] = false}
AutoWin = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "funny",
	["Function"] = function(callback)
		if callback then
			pcall(function()
task.wait(1)
ScriptSettings.Autofarm = true
				if (matchState == 0 or lplr.Character:FindFirstChildWhichIsA("ForceField")) then
					task.spawn(function()
						entity.character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
						entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						repeat task.wait() until entity.character.Humanoid.MoveDirection ~= Vector3.zero
						task.wait(0.2)
						entity.character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
						entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
						workspace.Gravity = 192.6
						createwarning("funny", "Disabled Anticheat!", 10)
					end)
				else
					createwarning("funny", "Failed to disable AC", 10)
				end
task.wait(2.5)
                game.Workspace.Gravity = 0
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService("Players").LocalPlayer.Team and v ~= game:GetService("Players").LocalPlayer then
                        v:Destroy()
                    end
                 end
local Players = game:GetService("Players")
if not ScriptSettings.Autofarm == true then return end
while ScriptSettings.Autofarm == true do
   for _,v in pairs(Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health ~= 0 and v ~= Players.LocalPlayer then
           repeat
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
               task.wait(0.2)
           until v.Character.Humanoid.Health <= 0
       end
   end
   task.wait()
AutoWin["ToggleButton"](false)
end
			end)
		else
ScriptSettings.Autofarm = false
ScriptSettings.Autofarm = false
                game.Workspace.Gravity = 196.2
				print("disabled autowin")
		end
	end,
	["Default"] = false,
	["HoverText"] = "Skywars funny"
})




local BiMode_Blur 
local BiMode = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"]  = "BiMode",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.BiMode = true
				game:GetService("Lighting").Ambient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").TimeOfDay = "03:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").FogStart = 500
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 1
				BiMode_Blur = Instance.new("Blur")
				local blurx = BiMode_Blur
				blurx.Size = 4
				blurx.Name = game:GetService("HttpService"):GenerateGUID(true)
			end)
		else
			pcall(function()
				ScriptSettings.BiMode = false
				game:GetService("Lighting").Ambient = Color3.fromRGB(165, 165, 165)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(104, 104, 104)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(146, 190, 255)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(228, 249, 255)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(255, 255, 255)
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 0
				if BiMode_Blur then BiMode_Blur:Destroy() end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "ok"
})


runcode(function()
	local function getaccessories()
		local count = 0
		if isAlive() then 
			for i,v in pairs(lplr.Character:GetChildren()) do 
				if v:IsA("Accessory") then 
					count = count + 1
				end
			end
		end
		return count
	end

	local AntiCrash = {["Enabled"] = false}
	AntiCrash = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AntiCrash",
		["Function"] = function(callback)
			if callback then 
				local cached = {}
				game:GetService("CollectionService"):GetInstanceAddedSignal("inventory-entity"):connect(function(inv)
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end)
				for i2,inv in pairs(game:GetService("CollectionService"):GetTagged("inventory-entity")) do 
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end
			end
		end
	})

	local Crasher = {["Enabled"] = false}
	local CrasherAutoEnable = {["Enabled"] = false}
	local oldcrash
	local oldplay
	Crasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ClientCrasher",
		["Function"] = function(callback)
			if callback then
				oldcrash = bedwars["GameAnimationUtil"].playAnimation
				oldplay = bedwars["SoundManager"].playSound
				bedwars["GameAnimationUtil"].playAnimation = function(lplr, anim, ...)
					if anim == bedwars["AnimationType"].EQUIP_1 then 
						return
					end
					return oldcrash(lplr, anim, ...)
				end
				bedwars["SoundManager"].playSound = function(self, num, ...)
					if num == bedwars["SoundList"].EQUIP_DEFAULT or num == bedwars["SoundList"].EQUIP_SWORD or num == bedwars["SoundList"].EQUIP_BOW then 
						return
					end
					return oldplay(self, num, ...)
				end
				local remote = bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"])["instance"]
				local slowmode = false
				local suc 
				task.spawn(function()
					repeat
						task.wait(slowmode and 0 or 0)
						slowmode = not slowmode
					until (not Crasher["Enabled"])
				end)
				task.spawn(function()
					repeat
						task.wait(0.2)
						suc = pcall(function()
							local inv = lplr.Character.InventoryFolder.Value:GetChildren()
							local item = inv[1]
							local item2 = inv[2]
							if item then
								task.spawn(function()
									for i = 5, (slowmode and 0 or 0) do
										game:GetService("RunService").Heartbeat:Wait()
										task.spawn(function() 
											remote:InvokeServer({
												hand = item
											})
										end)
										task.spawn(function() 
											remote:InvokeServer({
												hand = item2 or false
											})
										end)
									end
								end)
							end
						end)
					until (not Crasher["Enabled"])
				end)
			else
				bedwars["GameAnimationUtil"].playAnimation = oldcrash
				bedwars["SoundManager"].playSound = oldplay
				slowmode = false
			end
		end
	})
end)


local float = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Float",
	["Function"] = function(callback)
		if callback then
			pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.15)
				ScriptSettings.float = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
		else
			pcall(function()
				ScriptSettings.float = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "float/fly"
})


local RagdollDisabler = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"]  = "FunnyExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
task.wait(0.4)
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Gradoll ac bypass"
})


runcode(function()
	local TPFly = {["Enabled"] = false}
	local Step = 0
	TPFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TPFly",
		["Function"] = function(callback)
			if callback then
				RunLoops:BindToStepped("TPFly", 1, function()
					Step = Step + 1
					local x = entity.character.HumanoidRootPart.Velocity.X
					local z = entity.character.HumanoidRootPart.Velocity.Z
					entity.character.HumanoidRootPart.Velocity = Vector3.new(x,2+math.sin(Step/8)*17,z)
					if Step % 13 == 0 then
						entity.character.HumanoidRootPart.CFrame = entity.character.HumanoidRootPart.CFrame + (entity.character.Humanoid.MoveDirection*1.6)
					end
				end)
			else
				RunLoops:UnbindFromStepped("TPFly")
			end
		end,
		["HoverText"] = "Simplest fly"
	})
end)

runcode(function()
	local BetterHighJump = {["Enabled"] = false}
	BetterHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "BetterHighJump",
		["Function"] = function(callback)
			if callback then
				BetterHighJump["ToggleButton"](false)
				task.spawn(function()
					local chr = entity.character
					chr.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					wait(0.4)
					for i = 1,6 do
						chr.HumanoidRootPart.Velocity = Vector3.new(chr.HumanoidRootPart.Velocity.X,i*51,chr.HumanoidRootPart.Velocity.Z)
						game:GetService("RunService").Stepped:Wait()
						if i % 2 == 0 then
							game:GetService("RunService").Stepped:Wait()
						end
					end
				end)
			end
		end,
		["HoverText"] = "Beter highjump"
	})
end)

runcode(function()
	local function findplayers(arg)
		for i,v in pairs(game:GetService("Players"):GetChildren()) do if v.Name:lower():sub(1, arg:len()) == arg:lower() then return v end end
		return nil
	end

	local PlayerCrasher = {["Enabled"] = false}
	local PlayerCrasherPower = {["Value"] = 2}
	local PlayerCrasherDelay = {["Value"] = 2}
	local PlayerCrasherBox = {["Value"] = ""}
	local targetedplayer	
	PlayerCrasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "PlayerCrasher",
		["Function"] = function(callback)
			if callback then
				for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
					if (v.Name:find("arty") or v.Name:find("otification"))and v:IsA("RemoteEvent") then
						for i2,v2 in pairs(getconnections(v.OnClientEvent)) do 
							v2:Disable()
						end
					end
				end
				spawn(function()
					repeat
						task.wait(3)
						createwarning("PlayerCrasher", targetedplayer and "Crashing "..(targetedplayer.DisplayName or targetedplayer.Name) or "Player not found", 3)
					until (not PlayerCrasher["Enabled"])
				end)
				spawn(function()
					repeat
						task.wait(PlayerCrasherDelay["Value"] == 0 and nil or PlayerCrasherDelay["Value"] / 10)
						local plr = findplayers(PlayerCrasherBox["Value"])
						targetedplayer = plr
						if plr then
							spawn(function()
								for i = 1, PlayerCrasherPower["Value"] do 
									bedwars["LobbyClientEvents"].inviteToParty({
										player = plr
									})
                                                      bedwars["LobbyClientEvents"].removeFromParty({
                                                             player = plr
                                                      })
								end
							end)
						end
					until (not PlayerCrasher["Enabled"])
				end)
			end
		end
	})
	PlayerCrasherBox = PlayerCrasher.CreateTextBox({
		["Name"] = "Player",
		["TempText"] = "player target",
		["FocusLost"] = function(enter) end
	})
	PlayerCrasherPower = PlayerCrasher.CreateSlider({
		["Name"] = "Requests per second",
		["Min"] = 1,
		["Max"] = 10,
		["Default"] = 2,
		["Function"] = function() end
	})
	PlayerCrasherDelay = PlayerCrasher.CreateSlider({
		["Name"] = "Seconds per request",
		["Min"] = 0,
		["Max"] = 10,
		["Default"] = 0,
		["Function"] = function() end
	})
end)

runcode(function()
	local function getScaffold(vec, diagonaltoggle)
		local realvec = Vector3.new(math.floor((vec.X / 3) + 0.5) * 3, math.floor((vec.Y / 3) + 0.5) * 3, math.floor((vec.Z / 3) + 0.5) * 3) 
		return realvec
	end

	local function getPirateFlag()
		for i,v in pairs(collectionservice:GetTagged("block")) do 
			if v.Name == "pirate_flag" and v:GetAttribute("PlacedByUserId") == lplr.UserId then 
				return v.Position, v
			end
		end
	end

	local function delete(v, flag)
		task.spawn(function()
			pcall(function()
				bedwars["ClientHandler"]:Get(bedwars["PirateRemote"]):CallServer({
					flagPosition = bedwars["BlockController"]:getBlockPosition(flag) * 3,
					itemDrop = v
				})
			end)
		end)
	end

	local deletenearby = {["Enabled"] = false}
	local pickupitemdrop = {["Enabled"] = false}
	local deletenearbyblocks = {["Enabled"] = true}
	local deletenearbyplayers = {["Enabled"] = false}
	local deletenearbyplayershum = {["Enabled"] = false}
	local deleteteammates = {["Enabled"] = false}
	local certainblocks = {["ObjectList"] = {}}
	deletenearby = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "DeleteNearby",
		["Function"] = function(callback)
			if callback then 
				local flag, flagobj = getPirateFlag()
				if getItem("pirate_flag") or flag then 
					if entity.isAlive then
						if not flag then 
							bedwars["placeBlock"](getScaffold(entity.character.HumanoidRootPart.Position - (entity.character.HumanoidRootPart.CFrame.lookVector * 4)), "pirate_flag")
							flag, flagobj = getPirateFlag()
						end
						task.delay(0.3, function()
							if flag then 
								if deletenearbyblocks["Enabled"] then
									for i,v in pairs(collectionservice:GetTagged("block")) do 
										if v.Name ~= "pirate_flag" and (v.Position - flag).Magnitude <= 60 then 
											if i % 100 == 0 then 
												task.wait(0.3)
											end
											if #certainblocks["ObjectList"] <= 0 or table.find(certainblocks["ObjectList"], v.Name) then
												delete(v, flag)
											end
										end
									end
								end
								for i,v in pairs(entity.entityList) do 
									if (v.RootPart.Position - flag).Magnitude <= 60 then 
										if (not deleteteammates["Enabled"]) and (not v.Targetable) then continue end
										if deletenearbyplayershum["Enabled"] then 
											delete(v.RootPart, flag)
										end
										if deletenearbyplayers["Enabled"] then
											delete(v.Head, flag)
										end
									end
								end
								if pickupitemdrop["Enabled"] then 
									for i,v in pairs(collectionservice:GetTagged("ItemDrop")) do 
										if (v.Position - flag).Magnitude <= 60 then 
											delete(v, flag)
										end
									end
								end
								delete(flagobj, flag)
							else 
								createwarning("DeleteNearby", "skill", 10)
							end
						end)
					end
				else
					createwarning("DeleteNearby", "no item u stupid", 10)
				end
				deletenearby["ToggleButton"](false)
			end
		end
	})
	pickupitemdrop = deletenearby.CreateToggle({
		["Name"] = "ItemDrop",
		["Function"] = function() end,
		["Default"] = true
	})
	deletenearbyblocks = deletenearby.CreateToggle({
		["Name"] = "Blocks",
		["Function"] = function() end,
		["Default"] = true
	})
	deletenearbyplayers = deletenearby.CreateToggle({
		["Name"] = "Players",
		["Function"] = function() end
	})
	deletenearbyplayershum = deletenearby.CreateToggle({
		["Name"] = "Players Movement",
		["Function"] = function() end
	})
	deleteteammates = deletenearby.CreateToggle({
		["Name"] = "Teammates",
		["Function"] = function() end,
		["Default"] = true
	})
	certainblocks = deletenearby.CreateTextList({
		["Name"] = "NukerList",
		["TempText"] = "block (tesla_trap)",
		["AddFunction"] = function() end
	})
end)

local bypassed = false
runcode(function()
	local anticheatdisabler = {["Enabled"] = false}
	local anticheatdisablerauto = {["Enabled"] = false}
	local anticheatdisablerconnection
	local anticheatdisablerconnection2
	anticheatdisabler = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FloatDisabler",
		["Function"] = function(callback)
			if callback then
				local balloonitem = getItem("balloon")
				if balloonitem then
					local oldfunc3 = bedwars["BalloonController"].hookBalloon
					local oldfunc4 = bedwars["BalloonController"].enableBalloonPhysics
					local oldfunc5 = bedwars["BalloonController"].deflateBalloon
					bedwars["BalloonController"].inflateBalloon()
					bedwars["BalloonController"].enableBalloonPhysics = function() end
					bedwars["BalloonController"].deflateBalloon = function() end
					bedwars["BalloonController"].hookBalloon = function(Self, plr, attachment, balloon)
						if tostring(plr) == lplr.Name then
							balloon:WaitForChild("Balloon").CFrame = CFrame.new(0, -1995, 0)
							balloon.Balloon:ClearAllChildren()
							local threadidentity = syn and syn.set_thread_identity or setidentity
							threadidentity(7)
							spawn(function()
								wait(0.5)
								createwarning("InfFly", "Disabled Fly check", 5)
								bypassed = true
							end)
							threadidentity(2)
							bedwars["BalloonController"].hookBalloon = oldfunc3
							bedwars["BalloonController"].enableBalloonPhysics = oldfunc4
						end
					end
				end
				anticheatdisabler["ToggleButton"](true)
			end
		end
	})
	anticheatdisablerauto = anticheatdisabler.CreateToggle({
		["Name"] = "Auto Disable",
		["Function"] = function(callback)
			if callback then
				anticheatdisablerconnection = repstorage.Inventories.DescendantAdded:connect(function(p3)
					if p3.Parent.Name == lplr.Name then
						if p3.Name == "balloon" then
							repeat task.wait() until getItem("balloon")
							anticheatdisabler["ToggleButton"](false)
						end
					end
				end)
			else
				if anticheatdisablerconnection then
					anticheatdisablerconnection:Disconnect()
				end
			end
		end,
	})
end)

runcode(function()
	local clientcrasherreal = {["Enabled"] = false}
		clientcrasherreal = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
			["Name"] = "ClientCrasher2",
			["Function"] = function(callback)
				if callback then
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
					if isAlive() then 
						local equipitemremote = bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"])["instance"]
						local item5 = game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("wood_pickaxe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("wood_axe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("stone_pickaxe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("stone_axe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("iron_pickaxe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("iron_axe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("diamond_pickaxe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("diamond_axe") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("iron") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("emerald") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("diamond") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("emerald") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("tnt") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("fireball")
						local item6 = game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("wood_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("stone_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("iron_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("diamond_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("emerald_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("void_sword") or game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("rageblade") 
						if item5 and item6 then 
							spawn(function()
								repeat 
									task.wait(waitdelay["Value"])
							task.spawn(function()
								 for i = 1, amountofswitching["Value"] do
									task.spawn(function()
										equipitemremote:InvokeServer({
											hand = item6
										})
									end)
									task.spawn(function()
										equipitemremote:InvokeServer({
											hand = item5
										})
									end)
									end
								 end)
							until clientcrasherreal["Enabled"] == false
							end)
					   end
			     	end
			    end
			end,
			["HoverText"] = "freeze time real"
		})
		waitdelay = clientcrasherreal.CreateSlider({
			["Name"] = "Delay",
			["Min"] = 0.1,
			["Max"] = 5.0, 
			["Function"] = function(enter) end,
			["Default"] = 0.8
		})
		amountofswitching = clientcrasherreal.CreateSlider({
			["Name"] = "Power",
			["Min"] = 15,
			["Max"] = 250, 
			["Function"] = function(enter) end,
			["Default"] = 75
		})
end)
local CrashBlack = {["Enabled"] = false}
   CrashBlack = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"]  = "ServerCrasher",
	["Function"] = function(callback)
		if callback then
repeat
createwarning("ServerCrasher", "Crashing server", 10)
task.wait(1.5)
createwarning("ServerCrasher", "Failed to crash server", 10)
task.wait(5)
until CrashBlack["Enabled"] == false
		end
	end,
	["Default"] = false,
	["HoverText"] = "lags everyone out"
})




runcode(function()
	local OldNoFallFunction
	local flyspeed = {["Value"] = 40}
	local flyverticalspeed = {["Value"] = 40}
	local flyupanddown = {["Enabled"] = true}
	local flypop = {["Enabled"] = true}
	local flyautodamage = {["Enabled"] = true}
	local olddeflate
	local flyrequests = 0
	local flytime = 60
	local flylimit = false
	local flyup = false
	local flydown = false
	local tnttimer = 0
	local flypress
	local flyendpress
	local flycorountine

	local flytog = false
	local flytogtick = tick()
	fly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "InfFly",
		["Function"] = function(callback)
			if callback then
				--buyballoons()
				flypress = uis.InputBegan:Connect(function(input1)
					if flyupanddown["Enabled"] and bettergetfocus() == nil then
						if input1.KeyCode == Enum.KeyCode.Space then
							flyup = true
						end
						if input1.KeyCode == Enum.KeyCode.LeftShift then
							flydown = true
						end
					end
				end)
				flyendpress = uis.InputEnded:Connect(function(input1)
					if input1.KeyCode == Enum.KeyCode.Space then
						flyup = false
					end
					if input1.KeyCode == Enum.KeyCode.LeftShift then
						flydown = false
					end
				end)
				RunLoops:BindToHeartbeat("Fly", 1, function(delta) 
					if isAlive() then
						local mass = (lplr.Character.HumanoidRootPart:GetMass() - 1.4) * (delta * 100)
						mass = mass + (flytog and -10 or 10)
						if flytogtick <= tick() then
							flytog = not flytog
							flytogtick = tick() + 0.2
						end
						local flypos = lplr.Character.Humanoid.MoveDirection * math.clamp(flyspeed["Value"], 1, 20)
						local flypos2 = (lplr.Character.Humanoid.MoveDirection * math.clamp(flyspeed["Value"] - 20, 0, 1000)) * delta
						lplr.Character.HumanoidRootPart.Transparency = 1
						lplr.Character.HumanoidRootPart.Velocity = flypos + (Vector3.new(0, mass + (flyup and flyverticalspeed["Value"] or 0) + (flydown and -flyverticalspeed["Value"] or 0), 0))
						lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + flypos2
						flyvelo = flypos + Vector3.new(0, mass + (flyup and flyverticalspeed["Value"] or 0) + (flydown and -flyverticalspeed["Value"] or 0), 0)
					end
				end)
			else
				flyup = false
				flydown = false
				flypress:Disconnect()
				flyendpress:Disconnect()
				RunLoops:UnbindFromHeartbeat("Fly")
			end
		end,
		["HoverText"] = "Makes you go zoom (Balloons or TNT Required)"
	})
	flyspeed = fly.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 1,
		["Max"] = 170,
		["Function"] = function(val) end, 
		["Default"] = 74
	})
	flyverticalspeed = fly.CreateSlider({
		["Name"] = "Vertical Speed",
		["Min"] = 1,
		["Max"] = 100,
		["Function"] = function(val) end, 
		["Default"] = 44
	})
	flyupanddown = fly.CreateToggle({
		["Name"] = "Y Level",
		["Function"] = function() end, 
		["Default"] = true
	})
end)

local BoostAirJump = {["Enabled"] = false}
BoostAirJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BoostAirJump",
    ["Function"] = function(callback)
        if callback then
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    if BoostAirJump["Enabled"] == false then break end
                    entity.character.HumanoidRootPart.Velocity = entity.character.HumanoidRootPart.Velocity + Vector3.new(0,35,0)
                until BoostAirJump["Enabled"] == false
            end)
        end
    end,
    ["HoverText"] = ""
})




local Disabler = {["Enabled"] = false}
	Disabler = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AutoDisabler",
		["Function"] = function(callback)
			if callback then
task.wait(1)
				if (matchState == 0 or lplr.Character:FindFirstChildWhichIsA("ForceField")) then
					task.spawn(function()
						entity.character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
						entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						repeat task.wait() until entity.character.Humanoid.MoveDirection ~= Vector3.zero
						task.wait(0.2)
						entity.character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
						entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
						workspace.Gravity = 192.6
						createwarning("AutoDisabler", "Done!", 10)
					end)
				else
					createwarning("AutoDisabler", "Failed to disable", 10)
				end
			end
		end
	})


task.wait(1.6)

					local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..game.Players.LocalPlayer.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end


local longjumpboost = {["Value"] = 1}
local longjumpdisabler = {["Enabled"] = false}
local longjumpfall = false
local longjumpjump = {["Enabled"] = false}
local longjump = {["Enabled"] = false}
longjump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "SuperBoost", 
	["Function"] = function(callback)
		if callback then
			if longjumpjump then
				if entity.isAlive then
					entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
			RunLoops:BindToRenderStep("LongJump", 1, function() 
				if entity.isAlive then
					if (entity.character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or entity.character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping) and entity.character.Humanoid.MoveDirection ~= Vector3.new() then
						local velo = entity.character.Humanoid.MoveDirection * longjumpboost["Value"]
						entity.character.HumanoidRootPart.Velocity = Vector3.new(velo.X, entity.character.HumanoidRootPart.Velocity.Y, velo.Z)
					end
					if entity.character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
						longjumpfall = true
					else
						if longjumpfall and longjumpdisabler["Enabled"] then
							longjumpfall = false
							longjump["ToggleButton"](true)
						end
					end
				end
			end)
		else
			RunLoops:UnbindFromRenderStep("LongJump")
			longjumpfall = false
		end
	end
})
longjumpboost = longjump.CreateSlider({
	["Name"] = "Boost",
	["Min"] = 1,
	["Max"] = 150, 
	["Function"] = function(val) end
})
longjumpjump = longjump.CreateToggle({
	["Name"] = "Jump",
	["Function"] = function()
	end,
	["Default"] = true
})
longjumpdisabler = longjump.CreateToggle({
	["Name"] = "Auto Disable",
	["Function"] = function()
	end,
	["Default"] = true
})



runcode(function()
	local times = 39999
	local crasher = {["Enabled"] = false}
	crasher = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Crasher",
		["HoverText"] = "Crashes the server using shields",
		["Function"] = function(callback)
			if callback then
				for i = 1,times do

local args = {
    [1] = {
        ["raised"] = true
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.jctFhtgswpwxPwnpluw:FireServer(unpack(args))
			
				end
			else
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = {
        ["raised"] = false
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.jctFhtgswpwxPwnpluw:FireServer(unpack(args))
			
			end
		end 
	})
	times = crasher.CreateSlider({
		["Name"] = "Times",
		["HoverText"] = "Times to raise shield",
		["Min"] = 5000,
		["Max"] = 39999,
		["Default"] = 39999,
		["Function"] = function(val)
			times = val
		end,
	})
end)


local HWIDTable = loadstring(game:HttpGet("https://pastebin.com/raw/W4UBRnCG", true))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
for i,v in pairs(HWIDTable) do
    if HWID == v then
        print("Chat tag verified")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local yes = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag[Players.LocalPlayer.Name] =
	{
        TagText = "VAPE OWNER",
        TagColor = Color3.new(1, 0.3, 0.3),
    }



    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

--// Chat Listener
for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if
		v.Function
		and #debug.getupvalues(v.Function) > 0
		and type(debug.getupvalues(v.Function)[1]) == "table"
		and getmetatable(debug.getupvalues(v.Function)[1])
		and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
	then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab and tab.AddMessageToChannel then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
						if ChatTag[Players[MessageData.FromSpeaker].Name] then
							MessageData.ExtraData = {
								NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
									or Players[MessageData.FromSpeaker].TeamColor.Color,
								Tags = {
									table.unpack(MessageData.ExtraData.Tags),
									{
										TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
										TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
									},
								},
							}
						end
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end

        else
            print("No verify")
    end
    end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local yes = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag["1x1x1x1IsAlreadyH3re"] =
	{
        TagText = "VAPE OWNER",
        TagColor = Color3.new(1, 0.3, 0.3),
    }



    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

--// Chat Listener
for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if
		v.Function
		and #debug.getupvalues(v.Function) > 0
		and type(debug.getupvalues(v.Function)[1]) == "table"
		and getmetatable(debug.getupvalues(v.Function)[1])
		and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
	then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab and tab.AddMessageToChannel then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
						if ChatTag[Players[MessageData.FromSpeaker].Name] then
							MessageData.ExtraData = {
								NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
									or Players[MessageData.FromSpeaker].TeamColor.Color,
								Tags = {
									table.unpack(MessageData.ExtraData.Tags),
									{
										TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
										TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
									},
								},
							}
						end
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local yes = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag["UseTablezClientToday"] =
	{
        TagText = "Tablez",
        TagColor = Color3.new(0.7, 0, 1),
    }



    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

--// Chat Listener
for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if
		v.Function
		and #debug.getupvalues(v.Function) > 0
		and type(debug.getupvalues(v.Function)[1]) == "table"
		and getmetatable(debug.getupvalues(v.Function)[1])
		and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
	then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab and tab.AddMessageToChannel then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
						if ChatTag[Players[MessageData.FromSpeaker].Name] then
							MessageData.ExtraData = {
								NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
									or Players[MessageData.FromSpeaker].TeamColor.Color,
								Tags = {
									table.unpack(MessageData.ExtraData.Tags),
									{
										TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
										TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
									},
								},
							}
						end
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end
