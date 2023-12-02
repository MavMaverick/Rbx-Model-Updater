local function replacePartWithMesh(part, assignProps, assignPropsWedge, cylinderResize,cframeMove, transferProps, transferPropsWedge)

	local mesh = part:FindFirstChild("Mesh")
	print("MESH: ", mesh)
	if mesh then
		if part.Mesh.ClassName == "CylinderMesh" then
			local newPart = Instance.new("Part")
			newPart.Shape = Enum.PartType.Cylinder
			
			local partOffsetX = part.Mesh.Offset.X
			local partOffsetY = part.Mesh.Offset.Y
			local partOffsetZ = part.Mesh.Offset.Z
			
			local partSizeX = part.Size.X
			local partSizeY = part.Size.Y
			local partSizeZ = part.Size.Z
			local meshSizeX = part.Mesh.Scale.X
			local meshSizeY = part.Mesh.Scale.Y
			local meshSizeZ = part.Mesh.Scale.Z
			partSizeX *= meshSizeX
			partSizeY *= meshSizeY
			partSizeZ *= meshSizeZ
			
			local partRotateX = part.Rotation.X
			local partRotateY = part.Rotation.Y
			local partRotateZ = part.Rotation.Z
			partRotateZ -= 90
			
			local partPosX = part.Position.X
			local partPosY = part.Position.Y
			local partPosZ = part.Position.Z

			
			local localOffset = Vector3.new(-partOffsetX, -partOffsetY, partOffsetZ) -- The desired local offset on the x-axis
			local currentCFrame = part.CFrame
			local orientation = currentCFrame - currentCFrame.Position
			local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
			local newCFrame = CFrame.new(newPosition, orientation.LookVector)
			
			cylinderResize(partSizeX, partSizeZ)
			
			newPart.Size = Vector3.new(partSizeY, partSizeX, partSizeZ)
			newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
			newPart.CFrame = newCFrame
			newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
			newPart.Anchored = part.Anchored
			newPart.Material = part.Material
			newPart.Color = part.Color
			newPart.Transparency = part.Transparency
			newPart.Reflectance = part.Reflectance
			newPart.CanCollide = part.CanCollide
			newPart.Locked = part.Locked
			newPart.Name = part.Name
			newPart.Color = part.Color
			newPart.BottomSurface = Enum.SurfaceType.Smooth
			newPart.TopSurface = Enum.SurfaceType.Smooth
			newPart.Parent = workspace
			print("Cylindermesh")
			return

			
		elseif part.Mesh.ClassName == "BlockMesh" then
			local newPart = Instance.new("Part")
			local partOffsetX = part.Mesh.Offset.X
			local partOffsetY = part.Mesh.Offset.Y
			local partOffsetZ = part.Mesh.Offset.Z

			
			local partSizeX = part.Size.X
			local meshSizeX = part.Mesh.Scale.X
			partSizeX *= meshSizeX
			local partSizeY = part.Size.Y
			local meshSizeY = part.Mesh.Scale.Y
			partSizeY *= meshSizeY
			local partSizeZ = part.Size.Z
			local meshSizeZ = part.Mesh.Scale.Z
			partSizeZ *= meshSizeZ

			local partRotateX = part.Rotation.X
			local partRotateY = part.Rotation.Y
			local partRotateZ = part.Rotation.Z
			partRotateZ -= 90

			local partPosX = part.Position.X
			partPosX += partOffsetY
			local partPosY = part.Position.Y
			local partPosZ = part.Position.Z
			
			local localOffset = Vector3.new(-partOffsetX, -partOffsetY, partOffsetZ) -- The desired local offset on the x-axis
			local currentCFrame = part.CFrame
			local orientation = currentCFrame - currentCFrame.Position
			local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
			local newCFrame = CFrame.new(newPosition, orientation.LookVector)
			
			newPart.Size = Vector3.new(partSizeY, partSizeX, partSizeZ)
			newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
			newPart.CFrame = newCFrame
			newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
			newPart.Anchored = part.Anchored
			newPart.Material = part.Material
			newPart.Color = part.Color
			newPart.Transparency = part.Transparency
			newPart.Reflectance = part.Reflectance
			newPart.CanCollide = part.CanCollide
			newPart.Locked = part.Locked
			newPart.Name = part.Name
			newPart.Color = part.Color
			newPart.BottomSurface = Enum.SurfaceType.Smooth
			newPart.TopSurface = Enum.SurfaceType.Smooth
			newPart.Parent = workspace
			print("Blockmesh")
			return


			
		elseif part.Mesh.ClassName == "SpecialMesh" then
			local newPart

			-- Create a new part based on the mesh type
			if part.Mesh.MeshType == Enum.MeshType.Wedge then
				part.Rotation = part.Rotation
				part.Position = part.Position
				newPart = Instance.new("WedgePart")
				--local partSizeX, partSizeY, partSizeZ, partRotateX, partRotateY, partRotateZ, partPosX, partPosY, partPosZ = transferPropsWedge(part)
				local partSizeX = part.Size.X
				local meshSizeX = part.Mesh.Scale.X
				partSizeX *= meshSizeX
				local partSizeY = part.Size.Y
				local meshSizeY = part.Mesh.Scale.Y
				partSizeY *= meshSizeY
				local partSizeZ = part.Size.Z
				local meshSizeZ = part.Mesh.Scale.Z
				partSizeZ *= meshSizeZ

				local partRotateX = part.Rotation.X
				--partRotateX += 90
				local partRotateY = part.Rotation.Y
				--partRotateY += 90
				local partRotateZ = part.Rotation.Z
				--partRotateZ += 90

				local partPosX = part.Position.X
				--partPosX += 10
				local partPosY = part.Position.Y
				local partPosZ = part.Position.Z
				
				local localOffset = Vector3.new(0, 0, 0) -- The desired local offset on the x-axis
				local currentCFrame = part.CFrame
				local orientation = currentCFrame - currentCFrame.Position
				local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
				local newCFrame = CFrame.new(newPosition, orientation.LookVector)
				
				newPart.Size = Vector3.new(partSizeX, partSizeY, partSizeZ)
				newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
				newPart.CFrame = newCFrame
				print("Wedgepart before ", partRotateX, partRotateY, partRotateZ)
				newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
				newPart.Anchored = part.Anchored
				newPart.Material = part.Material
				--newPart.Color = part.Color
				newPart.Transparency = part.Transparency
				newPart.Reflectance = part.Reflectance
				newPart.CanCollide = part.CanCollide
				newPart.Locked = part.Locked
				newPart.Name = part.Name
				newPart.Color = Color3.fromRGB(255, 107, 154)
				newPart.BottomSurface = Enum.SurfaceType.Smooth
				newPart.TopSurface = Enum.SurfaceType.Smooth

				newPart.Parent = workspace
				print("Wedgepart final", partRotateX, partRotateY, partRotateZ)
				return



			elseif part.Mesh.MeshType == Enum.MeshType.Cylinder then
				newPart = Instance.new("CylnderPart")
				
				local partOffsetY = part.Mesh.Offset.Y
				
				local partSizeX = part.Size.X
				local meshSizeX = part.Mesh.Scale.X
				partSizeX *= meshSizeX
				local partSizeY = part.Size.Y
				local meshSizeY = part.Mesh.Scale.Y
				partSizeY *= meshSizeY
				local partSizeZ = part.Size.Z
				local meshSizeZ = part.Mesh.Scale.Z
				partSizeZ *= meshSizeZ

				local partRotateX = part.Rotation.X
				local partRotateY = part.Rotation.Y
				local partRotateZ = part.Rotation.Z
				partRotateZ -= 90

				local partPosX = part.Position.X
				local partPosY = part.Position.Y
				local partPosZ = part.Position.Z
				

				local localOffset = Vector3.new(0, -partOffsetY, 0) -- The desired local offset on the x-axis
				local currentCFrame = part.CFrame
				local orientation = currentCFrame - currentCFrame.Position
				local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
				local newCFrame = CFrame.new(newPosition, orientation.LookVector)
				
				cylinderResize(partSizeX, partSizeZ)
				newPart.Size = Vector3.new(partSizeY, partSizeX, partSizeZ)
				newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
				newPart.CFrame = newCFrame
				newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
				newPart.Anchored = part.Anchored
				newPart.Material = part.Material
				newPart.Color = part.Color
				newPart.Transparency = part.Transparency
				newPart.Reflectance = part.Reflectance
				newPart.CanCollide = part.CanCollide
				newPart.Locked = part.Locked
				newPart.Name = part.Name
				--newPart.Color = part.Color
				newPart.Color = Color3.fromRGB(10, 255, 39)
				newPart.BottomSurface = Enum.SurfaceType.Smooth
				newPart.TopSurface = Enum.SurfaceType.Smooth
				newPart.Parent = workspace
				print("Cylinder speciaslmesh")
				return

			elseif part.Mesh.MeshType == Enum.MeshType.FileMesh then
				if part.Mesh.MeshId == "http://www.roblox.com/Asset/?id=9755053" then
					part.Position = part.Position
					part.Rotation = part.Rotation
					print("EDGE")
					newPart = Instance.new("CornerWedgePart")
					local partSizeX = part.Size.X
					local meshSizeX = part.Mesh.Scale.X
					--partSizeX *= meshSizeX
					local partSizeY = part.Size.Y
					local meshSizeY = part.Mesh.Scale.Y
					--partSizeY *= meshSizeY
					local partSizeZ = part.Size.Z
					local meshSizeZ = part.Mesh.Scale.Z
					--partSizeZ *= meshSizeZ 

					local partRotateX = part.Orientation.X
					partRotateX -= 90
					local partRotateY = part.Orientation.Y
					partRotateY += 90
					local partRotateZ = part.Orientation.Z
					
					--GAZ
					partRotateZ -= partRotateZ * -2

					local partPosX = part.Position.X
					--partPosX += 10
					local partPosY = part.Position.Y
					local partPosZ = part.Position.Z

					local partMeshId = part.Mesh.MeshId

					local localOffset = Vector3.new(0, 0, 0) -- The desired local offset on the x-axis
					local currentCFrame = part.CFrame
					local orientation = currentCFrame - currentCFrame.Position
					local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
					local newCFrame = CFrame.new(newPosition, orientation.LookVector)

					newPart.Size = Vector3.new(partSizeY, partSizeZ, partSizeX)
					newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
					newPart.CFrame = newCFrame
					--print("ROTATIONNNNNNN ",partRotateX, partRotateY, partRotateZ)
					newPart.Orientation = Vector3.new(partRotateZ, partRotateY, partRotateX)
					newPart.Anchored = part.Anchored
					newPart.Material = part.Material
					newPart.Color = part.Color
					newPart.Transparency = part.Transparency
					newPart.Reflectance = part.Reflectance
					newPart.CanCollide = part.CanCollide
					newPart.Locked = part.Locked
					newPart.Name = part.Name
					newPart.Color = part.Color
					newPart.BottomSurface = Enum.SurfaceType.Smooth
					newPart.TopSurface = Enum.SurfaceType.Smooth
					
					local selectionBox = Instance.new("SelectionBox")
					selectionBox.Adornee = newPart
					selectionBox.Parent = newPart
					selectionBox.LineThickness = .04
					newPart.Parent = workspace
					--print("ROTATIONNNNNNN AFTERRRRRRRR N ",partRotateX, partRotateY, partRotateZ)
				else
					newPart = Instance.new("Part")
					local partSizeX = part.Size.X
					local meshSizeX = part.Mesh.Scale.X
					--partSizeX *= meshSizeX
					local partSizeY = part.Size.Y
					local meshSizeY = part.Mesh.Scale.Y
					--partSizeY *= meshSizeY
					local partSizeZ = part.Size.Z
					local meshSizeZ = part.Mesh.Scale.Z
					--partSizeZ *= meshSizeZ 

					local partRotateX = part.Rotation.X
					local partRotateY = part.Rotation.Y
					local partRotateZ = part.Rotation.Z
					partRotateZ -= 90

					local partPosX = part.Position.X
					--partPosX += 10
					local partPosY = part.Position.Y
					local partPosZ = part.Position.Z

					local partMeshId = part.Mesh.MeshId

					local localOffset = Vector3.new(0, 0, 0) -- The desired local offset on the x-axis
					local currentCFrame = part.CFrame
					local orientation = currentCFrame - currentCFrame.Position
					local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
					local newCFrame = CFrame.new(newPosition, orientation.LookVector)

					newPart.Size = Vector3.new(partSizeY, partSizeX, partSizeZ)
					newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
					newPart.CFrame = newCFrame
					newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
					newPart.Anchored = part.Anchored
					newPart.Material = part.Material
					newPart.Color = part.Color
					newPart.Transparency = part.Transparency
					newPart.Reflectance = part.Reflectance
					newPart.CanCollide = part.CanCollide
					newPart.Locked = part.Locked
					newPart.Name = part.Name
					--newPart.Color = part.Color
					newPart.Color = Color3.fromRGB(241, 255, 87)
					newPart.BottomSurface = Enum.SurfaceType.Smooth
					newPart.TopSurface = Enum.SurfaceType.Smooth
					local specialMesh = Instance.new("SpecialMesh")
					specialMesh.Parent = newPart
					-- Set the properties of the SpecialMesh
					specialMesh.MeshType = Enum.MeshType.FileMesh
					specialMesh.MeshId = part.Mesh.MeshId -- Replace with the ID of your mesh
					--specialMesh.TextureId = "rbxassetid://9876543210" -- Replace with the ID of your texture
					specialMesh.Scale = part.Mesh.Scale -- Adjust the scale as needed
					print("Filemesh part")

					--Selection box for checking true-size of cylinders.
					local selectionBox = Instance.new("SelectionBox")
					selectionBox.Adornee = newPart
					selectionBox.Parent = newPart
					selectionBox.LineThickness = .01
					newPart.Parent = workspace
					return
				end
				
			elseif part.Mesh.MeshType == Enum.MeshType.Head then
				newPart = Instance.new("Part")
				local partSizeX = part.Size.X
				local meshSizeX = part.Mesh.Scale.X
				--partSizeX *= meshSizeX
				local partSizeY = part.Size.Y
				local meshSizeY = part.Mesh.Scale.Y
				--partSizeY *= meshSizeY
				local partSizeZ = part.Size.Z
				local meshSizeZ = part.Mesh.Scale.Z
				--partSizeZ *= meshSizeZ 

				local partRotateX = part.Rotation.X
				local partRotateY = part.Rotation.Y
				local partRotateZ = part.Rotation.Z
				--partRotateZ -= 90

				local partPosX = part.Position.X
				--partPosX += 10
				local partPosY = part.Position.Y
				local partPosZ = part.Position.Z

				local partMeshId = part.Mesh.MeshId

				local localOffset = Vector3.new(0, 0, 0) -- The desired local offset on the x-axis
				local currentCFrame = part.CFrame
				local orientation = currentCFrame - currentCFrame.Position
				local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
				local newCFrame = CFrame.new(newPosition, orientation.LookVector)
				
				newPart.Size = Vector3.new(partSizeX, partSizeY, partSizeZ)
				newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
				newPart.CFrame = newCFrame
				newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
				newPart.Anchored = part.Anchored
				newPart.Material = part.Material
				newPart.Color = part.Color
				newPart.Transparency = part.Transparency
				newPart.Reflectance = part.Reflectance
				newPart.CanCollide = part.CanCollide
				newPart.Locked = part.Locked
				newPart.Name = part.Name
				newPart.Color = part.Color
				newPart.BottomSurface = Enum.SurfaceType.Smooth
				newPart.TopSurface = Enum.SurfaceType.Smooth
				local specialMesh = Instance.new("SpecialMesh")
				specialMesh.Parent = newPart
				-- Set the properties of the SpecialMesh
				specialMesh.MeshType = Enum.MeshType.Head
				specialMesh.MeshId = part.Mesh.MeshId -- Replace with the ID of your mesh
				--specialMesh.TextureId = "rbxassetid://9876543210" -- Replace with the ID of your texture
				specialMesh.Scale = part.Mesh.Scale -- Adjust the scale as needed
				print("Head part")

				--Selection box for checking true-size of cylinders.
				local selectionBox = Instance.new("SelectionBox")
				selectionBox.Adornee = newPart
				selectionBox.Parent = newPart
				selectionBox.LineThickness = .04
				newPart.Parent = workspace
				return

			else
				print("UNSUPPORTED SPECIAL MESH/////////////////")
				local dupedPart = part:Clone()
				dupedPart.Parent = workspace
				
			end
			
		end
		print("oppa gangnam")
	else
		print("Not a mesh")

		local dupedPart = part:Clone()
		dupedPart.Color = Color3.fromRGB(53, 255, 17)
		dupedPart.Parent = workspace
		return
	end
	print("Unsupported")

	
	
end

local function transferProps(part)	-- Works with cylinderMesh but wedges
	local partSizeX = part.Size.X
	local meshSizeX = part.Mesh.Scale.X
	partSizeX *= meshSizeX
	local partSizeY = part.Size.Y
	local meshSizeY = part.Mesh.Scale.Y
	partSizeY *= meshSizeY
	local partSizeZ = part.Size.Z
	local meshSizeZ = part.Mesh.Scale.Z
	partSizeZ *= meshSizeZ

	local partRotateX = part.Rotation.X
	local partRotateY = part.Rotation.Y
	local partRotateZ = part.Rotation.Z
	partRotateZ -= 90

	local partPosX = part.Position.X
	--partPosX += 10
	local partPosY = part.Position.Y
	local partPosZ = part.Position.Z
	
	return partSizeX, partSizeY, partSizeZ, partRotateX, partRotateY, partRotateZ, partPosX, partPosY, partPosZ
end

local function transferPropsWedge(part)	-- Works with Wedges
	local partSizeX = part.Size.X
	local meshSizeX = part.Mesh.Scale.X
	partSizeX *= meshSizeX
	local partSizeY = part.Size.Y
	local meshSizeY = part.Mesh.Scale.Y
	partSizeY *= meshSizeY
	local partSizeZ = part.Size.Z
	local meshSizeZ = part.Mesh.Scale.Z
	partSizeZ *= meshSizeZ

	local partRotateX = part.Rotation.X
	local partRotateY = part.Rotation.Y
	--partRotateY -= 90
	local partRotateZ = part.Rotation.Z
	--partRotateZ -= 90

	local partPosX = part.Position.X
	--partPosX += 10
	local partPosY = part.Position.Y
	local partPosZ = part.Position.Z

	return partSizeX, partSizeY, partSizeZ, partRotateX, partRotateY, partRotateZ, partPosX, partPosY, partPosZ
end
	--[[ The cframe is used to move the part along the local (not global) axis of the part, otherwise just modifying
		posistion causes newpart to not match up with the old one. The Cframe code was AI generated, I haven't reviewed
		it but currently, it works.
	]]
local function cframeMove(part)-- This makes the newpart not have uneccesary hitbox size
	-- Assume 'part' is the part you want to move
	local localOffset = Vector3.new(0, 0, 0) -- The desired local offset on the x-axis
	-- Get the current CFrame of the part
	local currentCFrame = part.CFrame
	-- Get the orientation of the part
	local orientation = currentCFrame - currentCFrame.Position
	-- Calculate the new position by subtracting the local offset relative to the part's orientation
	local newPosition = currentCFrame.Position - (orientation.RightVector * localOffset.X) - (orientation.UpVector * localOffset.Y) - (orientation.LookVector * localOffset.Z)
	-- Create a new CFrame using the new position and the part's current rotation
	local newCFrame = CFrame.new(newPosition, orientation.LookVector)
	return newCFrame

	-- Deprecated Cylindermesh's have different x and y values. So X and Y are switched for the new part.
	-- Vector3 allows passing in individual values for Size.
end
local function cylinderResize(partSizeX, partSizeZ)
	if partSizeX > partSizeZ then
		partSizeX = partSizeZ
	elseif partSizeZ > partSizeX then
		partSizeZ = partSizeX
	end
end


local function assignProps(newPart, part, partSizeX, partSizeY, partSizeZ, partRotateX, partRotateY, partRotateZ, partPosX, partPosY, partPosZ, newCFrame)
	
	newPart.Size = Vector3.new(partSizeY, partSizeX, partSizeZ)
	newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
	newPart.CFrame = newCFrame
	newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
	newPart.Anchored = part.Anchored
	newPart.Material = part.Material
	newPart.Color = part.Color
	newPart.Transparency = part.Transparency
	newPart.Reflectance = part.Reflectance
	newPart.CanCollide = part.CanCollide
	newPart.Locked = part.Locked
	newPart.Name = part.Name
	newPart.Color = part.Color
	newPart.BottomSurface = Enum.SurfaceType.Smooth
	newPart.TopSurface = Enum.SurfaceType.Smooth
	newPart.Parent = workspace
end

local function assignPropsWedge(newPart, part, partSizeX, partSizeY, partSizeZ, partRotateX, partRotateY, partRotateZ, partPosX, partPosY, partPosZ, newCFrame)

	newPart.Size = Vector3.new(partSizeX, partSizeY, partSizeZ)
	newPart.Position = Vector3.new(partPosX, partPosY, partPosZ)
	newPart.CFrame = newCFrame
	newPart.Rotation = Vector3.new(partRotateX, partRotateY, partRotateZ)
	newPart.Anchored = part.Anchored
	newPart.Material = part.Material
	newPart.Color = part.Color
	newPart.Transparency = part.Transparency
	newPart.Reflectance = part.Reflectance
	newPart.CanCollide = part.CanCollide
	newPart.Locked = part.Locked
	newPart.Name = part.Name
	newPart.Color = part.Color
	newPart.BottomSurface = Enum.SurfaceType.Smooth
	newPart.TopSurface = Enum.SurfaceType.Smooth

	newPart.Parent = workspace
end

--local model = workspace:FindFirstChild("block")	-- Replace string with part name


local function processModel(model)
	for _, child in pairs(model:GetChildren()) do
		if child:IsA("Model") then
			-- If the child is a Model, process it recursively
			processModel(child)
		elseif child:IsA("Part") or child:IsA("WedgePart") or child:IsA("CornerWedgePart") then
			print(child)
			-- If the child is a Part, check for a mesh and replace if necessary
			replacePartWithMesh(child, assignProps, assignPropsWedge, cylinderResize, cframeMove, transferProps, transferPropsWedge)

		end
	end
end

-- Replace parts in the selected model
local model = workspace:FindFirstChild("M12")
if model and model:IsA("Model") then
	processModel(model)
else
	warn("Please select a valid model in the workspace.")
end

--[				--print("SpecialMesh")
--print("Part current size is ", part.Size)
--print("Curr size of the newpart will be ", partSizeY, partSizeX, partSizeZ)
--elseif mesh.MeshType == Enum.MeshType.Cylinder then
--	newPart = Instance.new("CylinderPart")
--elseif mesh.MeshType == Enum.MeshType.Brick then
--	newPart = Instance.new("Part")
--elseif mesh.MeshType == Enum.MeshType.Sphere then
--	newPart = Instance.new("BallMesh")
--elseif mesh.MeshType == Enum.MeshType.CornerWedge then
--	newPart = Instance.new("CornerWedgePart")
--else
--	-- Rename the part if the mesh type is unsupported
--	part.Name = "Part Meshtype Unsupported"
--	part.Color = Color3.fromRGB(255, 103, 33)
--Selection box for checking true-size of cylinders.
--local selectionBox = Instance.new("SelectionBox")
--selectionBox.Adornee = newPart
--selectionBox.Parent = newPart
--selectionBox.LineThickness = .04]--
