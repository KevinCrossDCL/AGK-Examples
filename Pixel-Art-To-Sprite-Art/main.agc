
// Project: Pixel-Art-To-Sprite-Art 
// Created: 20-12-09

// show all errors

SetErrorMode(2)

// set window properties
SetWindowTitle( "Pixel-Art-To-Sprite-Art" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 )
SetClearColor(50, 50, 50)

global spriteGap# as float = 1.5

ConvertPixelArtToSpriteArt(LoadImage("pixel-art-acorn.png"), 20, 20, 640, 640)

do
	
    Sync()
loop

function ConvertPixelArtToSpriteArt(pixelArtImage as integer, pixelArtColumns as integer, pixelArtRows as integer, spriteGridWidth# as float, spriteGridHeight# as integer)
	/*
		pixelArtImage		: The ID of the original image that you want to convert
		pixelArtRows		: The number of rows in the original image
		pixelArtColumns	: The number of columns in the original image
		spriteGridWidth#	: The final width of the sprite art. This will be split into a grid by the number of columns in the original image
		spriteGridHeight#	: The final height of the sprite art. This will be split into a grid by the number of rows in the original image
	*/
	local pixelArtBlockHeight# as float : pixelArtBlockHeight# = GetImageHeight(pixelArtImage) / pixelArtRows
	local pixelArtBlockWidth# as float : pixelArtBlockWidth# = GetImageWidth(pixelArtImage) / pixelArtColumns
	local pixelArtHeight# as float : pixelArtHeight# = GetImageHeight(pixelArtImage)
	local pixelArtWidth# as float : pixelArtWidth# = GetImageWidth(pixelArtImage)
	local memblock as integer : memblock = CreateMemblockFromImage(pixelArtImage)
	local memblockByte as integer
	local memblockColor as float[4]
	local pixelX as integer : memblockPixelX = 0
	local pixelY as integer : memblockPixelY = 0
	local spriteGridBlockHeight# as float : spriteGridBlockHeight# = spriteGridHeight# / pixelArtRows
	local spriteGridBlockWidth# as float : spriteGridBlockWidth# = spriteGridWidth# / pixelArtColumns
	local x as integer
	local y as integer
	
	for y = 1 to pixelArtRows
		for x = 1 to pixelArtColumns
			pixelX = ((x * pixelArtBlockWidth#) - (pixelArtBlockWidth# / 2.0))
			pixelY = ((y * pixelArtBlockHeight#) - (pixelArtBlockHeight# / 2.0)) - 1
			memblockByte = 12 + ((pixelY * pixelArtWidth#) * 4) + (pixelX * 4)
			memblockColor[1] = GetMemblockByte(memblock, memblockByte)
			memblockColor[2] = GetMemblockByte(memblock, memblockByte + 1)
			memblockColor[3] = GetMemblockByte(memblock, memblockByte + 2)
			memblockColor[4] = GetMemblockByte(memblock, memblockByte + 3)
			spr = CreateSprite(0)
			SetSpriteColor(spr, memblockColor[1], memblockColor[2], memblockColor[3], memblockColor[4])
			SetSpriteSize(spr, spriteGridBlockWidth# - spriteGap#, spriteGridBlockHeight# - spriteGap#)
			SetSpritePosition(spr, x * spriteGridBlockWidth#, y * spriteGridBlockHeight#)
		next
	next
endfunction