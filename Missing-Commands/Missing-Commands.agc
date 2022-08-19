function AddLeadingZeros(string$ as string, noOfZeros as integer)
	local i as integer
	
	for i = 1 to noOfZeros
		if (len(string$) < noOfZeros)
			string$ = "0" + string$
		endif
	next
endfunction string$



function AddOrdinalSuffix(i)
	local j as integer
	local k as integer
	local l$ as string
	
	j = mod(i, 10)
	k = mod(i, 100)
	if (j = 1 and k <> 11)
		l$ = str(i) + "st"
	elseif (j = 2 and k <> 12)
		l$ = str(i) + "nd"
	elseif (j = 3 and k <> 13)
		l$ = str(i) + "rd"
	else
		l$ = str(i) + "th"
	endif
endfunction l$



function AddThousandsSeperator(number as integer, seperator$ as string)
	local counter as integer
	local formattedNumber$ as string
	local i as integer
	local numberLength as integer
	
	numberLength = len(str(number))
	
	if (numberLength < 4)
		formattedNumber$ = str(number)
	else
		counter = 0
		for i = numberLength to 1 step -1
			inc counter
			formattedNumber$ = Mid(str(number), i, 1) + formattedNumber$
			if (mod(counter, 3) = 0 and i <> 1) then formattedNumber$ = seperator$ + formattedNumber$
		next
	endif
endfunction formattedNumber$



function GetObjectHit(x# as float, y# as float, distance# as float)
	local unitX# as float
	local unitY# as float
	local unitZ# as float
	local startVectorX# as float
	local startVectorY# as float
	local startVectorZ# as float
	local endVectorX# as float
	local endVectorY# as float
	local endVectorZ# as float
	local objectHit as integer

	unitX# = Get3DVectorXFromScreen(x#, y#)
	unitY# = Get3DVectorYFromScreen(x#, y#)
	unitZ# = Get3DVectorZFromScreen(x#, y#)
	startVectorX# = unitX# + GetCameraX(1)
	startVectorY# = unitY# + GetCameraY(1)
	startVectorZ# = unitZ# + GetCameraZ(1)
	endVectorX# = distance# * unitX# + GetCameraX(1)
	endVectorY# = distance# * unitY# + GetCameraY(1)
	endVectorZ# = distance# * unitZ# + GetCameraZ(1)
	objectHit = ObjectRayCast(0, startVectorX#, startVectorY#, startVectorZ#, endVectorX#, endVectorY#, endVectorZ#)
endfunction objectHit



function GetObjectSizeX(objectID as integer)
	local x# as float
	
    x# = GetObjectSizeMaxX(objectID) - GetObjectSizeMinX(objectID)
endfunction x#



function GetObjectSizeY(objectID as integer)
	local y# as float
	
    y# = GetObjectSizeMaxY(objectID) - GetObjectSizeMinY(objectID)
endfunction y#



function GetObjectSizeZ(objectID as integer)
	local z# as float
	
    z# = GetObjectSizeMaxZ(objectID) - GetObjectSizeMinZ(objectID)
endfunction z#



function InRange(variable as integer, min# as float, max# as float)
	local inRange as integer : inRange = 0
	
	if (variable >= min# and variable# <= max#) then inRange = 1
endfunction inRange



function Lerp(min# as float, max# as float, f# as float)
	local result# as float
	
	result# = min# + f# * (max# - min#)
endfunction result#



function MaxFloat(a# as float, b# as float)
	local maxValue# as float
	
	if (a# > b#)
		maxValue# = a#
	else
		maxValue# = b#
	endif
endfunction maxValue#



function MaxInt(a as integer, b as integer)
	local maxValue as integer
	
	if (a > b)
		maxValue = a
	else
		maxValue = b
	endif
endfunction maxValue



function MinFloat(a# as float, b# as float)
	local minValue# as float
	
	if (a# < b#)
		minValue# = a#
	else
		minValue# = b#
	endif
endfunction minValue#



function MinInt(a as integer, b as integer)
	local minValue as integer
	
	if (a < b)
		minValue = a
	else
		minValue = b
	endif
endfunction minValue



function PercentToVirtualHeight(percentage# as float)
	local virtualHeight# as float
	
	virtualHeight# = ((GetScreenBoundsBottom() - GetScreenBoundsTop()) / 100.0) * percentage#
endfunction virtualHeight#



function PercentToVirtualWidth(percentage# as float)
	local virtualWidth# as float
	
	virtualWidth# = ((GetScreenBoundsRight() - GetScreenBoundsLeft()) / 100.0) * percentage#
endfunction virtualWidth#



function PercentToVirtualX(percentage# as float)
	local virtualX# as float
	
	virtualX# = GetScreenBoundsLeft() + (((GetScreenBoundsRight() - GetScreenBoundsLeft()) / 100.0) * percentage#)
endfunction virtualX#



function PercentToVirtualY(percentage# as float)
	local virtualY# as float
	
	virtualY# = GetScreenBoundsTop() + (((GetScreenBoundsBottom() - GetScreenBoundsTop()) / 100.0) * percentage#)
endfunction virtualY#



function SetObjectSize(objectID as integer, x# as float, y# as float, z# as float)
	local originalSizeX# as float
	local originalSizeY# as float
	local originalSizeZ# as float
	
    originalSizeX# = GetObjectSizeMaxX(objectID) - GetObjectSizeMinX(objectID)
    originalSizeY# = GetObjectSizeMaxY(objectID) - GetObjectSizeMinY(objectID)
    originalSizeZ# = GetObjectSizeMaxZ(objectID) - GetObjectSizeMinZ(objectID)
    SetObjectScalePermanent(objectID, x# / originalSizeX#, y# / originalSizeY#, z# / originalSizeZ#)
endfunction
