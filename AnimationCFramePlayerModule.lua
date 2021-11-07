local a = {}
local TweenService = game:GetService("TweenService")
local Tinfo = TweenInfo.new(0,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
local RunService = game:GetService("RunService")

local wait = function(t)
	t = t or 0.0001
	local c = 0
	while c < t do
		c += RunService.Heartbeat:Wait()
	end
end

function a:Play(Model:Model,lm)
	self.NormalCFrame = {}
	self.CFrameNext = {}
	self.x = {}
	
	for i,v in next,Model:GetDescendants() do
		if v:IsA("Motor6D") then
			rawset(self.NormalCFrame,v.Name,v.C1)
		end
	end
	local r = {}
	if rawequal(type(lm),"Instance") then
		local r = require(lm)
	elseif rawequal(type(lm),"table") then
		local r = lm
	end
	local fps = r.Properties.FramePerSeconds or 120
	local il = r.Properties.Looping
	local ahn = r.Properties.AllowHandleName
	local Keyframes = r.Keyframes
	local t = {}
	local sp = 0
	
	
	local function forloop(v,name)
		for n,b in next,v do
			if rawequal(type(b),"table") then
				forloop(b,n)
			elseif name ~= "Handle" then
				rawset(self.CFrameNext,name,b)
			elseif rawequal(name,"Handle") and ahn then
				rawset(self.CFrameNext,name,b)
			end
		end
	end
	
	for i,v in next,Keyframes do
		table.insert(t,i)
	end
	
	table.sort(t,function(x,y)
		return x < y
	end)
	
	local function make()
		for iasd,v in ipairs(t) do
			v = Keyframes[v]
			forloop(v,iasd)
			local Complete = 0
			local C = 0
			for qw,qe in next,self.CFrameNext do
				C += 1
				spawn(function()
					local hjk:BasePart = Model:FindFirstChild(qw,true)
					if hjk then
						local mo:Motor6D = hjk:FindFirstChildWhichIsA("Motor6D")
						for as,sd in next,Model:GetDescendants() do
							if sd:IsA("Motor6D") then
								if rawequal(sd.Part1,hjk) then
									mo = sd
									break
								end
							end
						end
						if mo and qe then
							local Tnew = TweenInfo.new(1/fps,Tinfo.EasingStyle,Tinfo.EasingDirection,0,false,0)
							local ts:TweenBase =  TweenService:Create(mo,Tnew,{C1 = self.NormalCFrame[mo.Name] * qe:Inverse()})
							ts:Play()
							ts.Completed:Wait()
						end
					end
					Complete += 1
				end)
			end
			repeat
				wait()
			until Complete >= C
			Complete = 0
			sp = iasd
		end
	end
	if il then
		while true do
			make()
		end
	else
		make()
	end
end

return a