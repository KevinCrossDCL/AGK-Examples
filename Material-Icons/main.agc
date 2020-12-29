
SetVirtualResolution(450, 450)
SetWindowSize(450, 450, 0)
SetScissor(0, 0, 0, 0)
SetSyncRate(60, 0)

type typeIcon
	sortKey$ as string
	id as integer
	imageID as integer
	name$ as string
endtype
global icon as typeIcon[]

blankIcon as typeIcon

iconsPath$ as string : iconsPath$ = "baseline/96px/"

fileID = OpenToRead(iconsPath$ + "/Material-Icons.txt")
for a = 1 to 4
	img = LoadImage(iconsPath$ + "/Material-Icons-" + AddLeadingZeros(str(a), 2) + ".png")
	for b = 1 to 400
		line$ = ReadLine(fileID)
		subimage = LoadSubImage(img, "icon" + str(b))
		icon.insert(blankIcon)
		id = icon.length
		icon[id].sortKey$ = line$
		icon[id].id = id
		icon[id].imageID = subimage
		icon[id].name$ = line$
	next
next
CloseFile(fileID)
icon.sort()

spr = CreateSprite(GetIconImageID("settings_phone"))
SetSpritePosition(spr, 50, 50)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("backup_table"))
SetSpritePosition(spr, 150, 50)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("donut_large"))
SetSpritePosition(spr, 250, 50)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("history"))
SetSpritePosition(spr, 350, 50)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("message"))
SetSpritePosition(spr, 50, 150)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("share"))
SetSpritePosition(spr, 150, 150)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("reply_all"))
SetSpritePosition(spr, 250, 150)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

spr = CreateSprite(GetIconImageID("swap_calls"))
SetSpritePosition(spr, 350, 150)
SetSpriteSize(spr, 50, 50)
SetSpriteColor(spr, random(128, 255), random(128, 255), random(128, 255), 255)

do
	
    sync()
loop

function AddLeadingZeros(string$ as string, noOfZeros as integer)
	for i = 1 to noOfZeros
		if (len(string$) < noOfZeros)
			string$ = "0" + string$
		endif
	next
endfunction string$

function GetIconImageID(iconName$ as string)
	
endfunction icon[icon.find(iconName$)].imageID
	
