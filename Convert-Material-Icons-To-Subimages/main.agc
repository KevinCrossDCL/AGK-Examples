
SetVirtualResolution(960, 960)
SetWindowSize(960, 960, 0)
SetScissor(0, 0, 0, 0)
SetSyncRate(60, 0)
SetPrintSize(15)
SetClearColor(150, 150, 150)

// Get original icons from: https://github.com/google/material-design-icons/tree/master/png
// Last downloaded: 5th December 2020

// Change: This path below should point to the downloaded icons folder
materialsFolderPath$ as string : materialsFolderPath$ = "/Users/kevincross/Downloads/material-design-icons-master/png"
materialsFolder as integer : materialsFolder = OpenRawFolder(materialsFolderPath$)
// Change: This path below should point to a folder where you want to export the icon subimages to. 
rawMediaFolderPath$ as string : rawMediaFolderPath$ = "/Users/kevincross/Desktop/AGK/Material-Icons"

extractTheseIconsOnly$ as string[]
// Change: Extract only icons you're interested in, or leave blank to extract all. Be sure to sort them too afterwards with extractTheseIconsOnly$$.sort()
//extractTheseIconsOnly$$ = ["account_box", "add", "delete", "edit", "refresh", "search"]
//extractTheseIconsOnly$$.sort()

for s = 1 to 5
	if (s = 1) then style$ = ""
	if (s = 2) then style$ = "outlined"
	if (s = 3) then style$ = "round"
	if (s = 4) then style$ = "sharp"
	if (s = 5) then style$ = "twotone"
	if (s = 1)
		outputFolder$ = "baseline"
	else
		outputFolder$ = style$
	endif
	
	for p = 1 to 2
		if (p = 1)
			pixels = 48
			size$ = "1x"
			SetVirtualResolution(960, 960)
			SetWindowSize(960, 960, 0)
		endif
		if (p = 2)
			pixels = 96
			size$ = "2x"
			SetVirtualResolution(1920, 1920)
			SetWindowSize(1920, 1920, 0)
		endif
		
		numberOfIcons = 0
		x = 0
		y = 0
		subimages = 0
		images = 0
		ClearScreen()
		OpenToWrite(100, "raw:" + rawMediaFolderPath$ + "/" + outputFolder$ + "/" + str(pixels) + "px/Material-Icons.txt")			
		for a = 0 to GetRawFolderNumFolders(materialsFolder) - 1
			groupFolder = OpenRawFolder(materialsFolderPath$ + "/" + GetRawFolderFolderName(materialsFolder, a))
			for b = 0 to GetRawFolderNumFolders(groupFolder) - 1
				nameFolder = OpenRawFolder(materialsFolderPath$ + "/" + GetRawFolderFolderName(materialsFolder, a) + "/" + GetRawFolderFolderName(groupFolder, b) + "/materialicons" + style$ + "/48dp/" + size$)
				for c = 0 to GetRawFolderNumFiles(nameFolder) - 1
					if (GetRawFolderFileName(nameFolder, c) = ".DS_Store") then continue
					
					imageFilename$ = GetRawFolderFileName(nameFolder, c)
					imageFilename$ = ReplaceString(imageFilename$, outputFolder$ + "_", "", 1)
					//imageFilename$ = ReplaceString(imageFilename$, "outline_", "", 1)
					imageFilename$ = ReplaceString(imageFilename$, "_black", "", 1)
					imageFilename$ = ReplaceString(imageFilename$, "_48dp.png", "", 1)
					
					if (extractTheseIconsOnly$.length > -1)
						if (extractTheseIconsOnly$.find(imageFilename$) = -1)
							continue
						endif
					endif
					
					if (y = 0 and x = 0)
						inc subimages
						CloseFile(subimages)
						OpenToWrite(subimages, "raw:" + rawMediaFolderPath$ + "/" + outputFolder$ + "/" + str(pixels) + "px/Material-Icons-" + AddLeadingZeros(str(subimages), 2) + " subimages.txt")
					endif
								
					inc numberOfIcons
					icon = LoadImage("raw:" + materialsFolderPath$ + "/" + GetRawFolderFolderName(materialsFolder, a) + "/" + GetRawFolderFolderName(groupFolder, b) + "/materialicons" + style$ + "/48dp/" + size$ + "/" + GetRawFolderFileName(nameFolder, c))
					
					memblock = CreateMemblockFromImage(icon)
					size = GetMemblockSize(memblock)
					for byte = 12 to size - 1 step 4
 						SetMemblockByte(memblock, byte, 255 - GetMemblockByte(memblock, byte))
   						SetMemblockByte(memblock, byte + 1, 255 - GetMemblockByte(memblock, byte + 1))
    						SetMemblockByte(memblock, byte + 2, 255 - GetMemblockByte(memblock, byte + 2))
					next
					icon = CreateImageFromMemblock(memblock)
					
					sprite = CreateSprite(icon)
					SetSpritePosition(sprite, x * pixels, y * pixels)
					inc images
				
					WriteLine(100, imageFilename$)
					WriteLine(subimages, "icon" + str(images) + ":" + str(x * pixels) + ":" + str(y * pixels) + ":" + str(pixels) + ":" + str(pixels))
					DrawSprite(sprite)
					DeleteSprite(sprite)
					
					inc x
					if (x > 19)
						x = 0
						inc y
					endif
					if (y > 19 and x = 0)
						images = 0
						y = 0
						subImage = GetImage(0, y * pixels, 960 * p, (y * pixels) + (960 * p))
						ResizeImage(subImage, 960 * p, 960 * p)
						ClearScreen()
						SaveImage(subImage, "raw:" + rawMediaFolderPath$ + "/" + outputFolder$ + "/" + str(pixels) + "px/Material-Icons-" + AddLeadingZeros(str(subimages), 2) + ".png")
						DeleteImage(subImage)
					endif
				next
			next
		next
		CloseFile(100)
		if (y <> 20)
			y = 0
			subImage = GetImage(0, y * pixels, 960 * p, (y * pixels) + (960 * p))
			ResizeImage(subImage, 960 * p, 960 * p)
			ClearScreen()
			SaveImage(subImage, "raw:" + rawMediaFolderPath$ + "/" + outputFolder$ + "/" + str(pixels) + "px/Material-Icons-" + AddLeadingZeros(str(subimages), 2) + ".png")
			DeleteImage(subImage)
		endif
	next
next

Message("Completed")

function AddLeadingZeros(string$ as string, noOfZeros as integer)
	for i = 1 to noOfZeros
		if (len(string$) < noOfZeros)
			string$ = "0" + string$
		endif
	next
endfunction string$
