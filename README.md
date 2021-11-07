# Play-Animation-CFrame
## Requirement:
- [Animation Convertor](https://www.roblox.com/library/442028078/Animation-Converter) || This Plugin For Convert Animation To CFrame.
- #### Lua Beginner Skill (require, modulescript, etc.)

## Tutorial:
#### 1.Use Animation Convertor And Import Animation.
![alallalalal](https://i.gyazo.com/30ec2fa5bbdd70108c803572e18325ef.png)
#### 2.And Click for create modulescript. (I called Module Animation.)
![alallalaall](https://i.gyazo.com/9f44a6b34ca0d1af150d3bf8ec7837e1.png)
#### 3.Create Script For Play animation
#### 4.Now Import AnimationCFramePlayerModule.lua
```lua
local Player = require(PATH_TO_AnimationCFramePlayerModule)
local AnimationModulePath = require(PATH_TO_MODULE_ANIMATION)
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		wait(3)
		print("play!")
		task.synchronize()
		Player:Play(char,script:WaitForChild("s"))
	end)
end)
```
#### 5.Congrats🎉 this end of tutorial rn
