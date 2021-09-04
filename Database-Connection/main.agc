
// Project: Database-Connection 
// Created: 21-09-04

SetErrorMode(2)
SetWindowTitle("Database-Connection")
SetWindowSize(1024, 768, 0)
SetVirtualResolution(1024, 768)
SetSyncRate(30, 0)
UseNewDefaultFonts(1)

type typeScore
	id as integer
	name$ as string
	score as integer
endtype

global buttonCounter as integer : buttonCounter = 0
global httpHost$ as string : httpHost$ = "localhost:8888"
global httpFolder$ as string : httpFolder$ = "agk-db-example"
global scores as typeScore[]

http = CreateHTTPConnection()
SetHTTPHost(http, httpHost$, 0)

btnCreateTable = CreateButton(150, 75, 500, 50, "Create Scores Table")

txtName = CreateText("Name:")
SetTextSize(txtName, 30)
SetTextPosition(txtName, 362, 120)
editBoxName = CreateEditBox()
SetEditBoxSize(editBoxName, 300, 40)
SetEditBoxTextSize(editBoxName, 30)
SetEditBoxPosition(editBoxName, 362, 150)
txtScore = CreateText("Score:")
SetTextSize(txtScore, 30)
SetTextPosition(txtScore, 362, 190)
editBoxScore = CreateEditBox()
SetEditBoxSize(editBoxScore, 300, 40)
SetEditBoxTextSize(editBoxScore, 30)
SetEditBoxPosition(editBoxScore, 362, 220)
btnAddScoreToTable = CreateButton(150, 75, 500, 320, "Add Score To Table")

btnGetTop10 = CreateButton(150, 75, 500, 440, "Get Top 10 Scores")

txtDeleteID = CreateText("ID to delete:")
SetTextSize(txtDeleteID, 30)
SetTextPosition(txtDeleteID, 362, 500)
editBoxDeleteID = CreateEditBox()
SetEditBoxSize(editBoxDeleteID, 300, 40)
SetEditBoxTextSize(editBoxDeleteID, 30)
SetEditBoxPosition(editBoxDeleteID, 362, 530)
btnDeleteID = CreateButton(150, 75, 500, 630, "Delete ID")

do
	print(response$)
	for i = 0 to scores.length
		print(str(scores[i].id) + ": " + scores[i].name$ + " = " + str(scores[i].score))
	next
	
	if (GetVirtualButtonPressed(btnCreateTable))
		SendHTTPRequestASync(http, httpFolder$ + "/create-scores-table.php")
		while GetHTTPResponseReady(http) = 0
			print("Connecting...")
			Sync()
		endwhile
		response$ = GetHTTPResponse(http)
	endif
	if (GetVirtualButtonPressed(btnAddScoreToTable))
		if (GetEditBoxText(editBoxName) = "" or GetEditBoxText(editBoxScore) = "")
			response$ = "Name or score missing"
		else
			SendHTTPRequestASync(http, httpFolder$ + "/add-to-scores-table.php", "&name=" + GetEditBoxText(editBoxName) + "&score=" + GetEditBoxText(editBoxScore))
			while GetHTTPResponseReady(http) = 0
				print("Connecting...")
				Sync()
			endwhile
			response$ = GetHTTPResponse(http)
			scores.length = -1
		endif
	endif
	if (GetVirtualButtonPressed(btnGetTop10))
		SendHTTPRequestASync(http, httpFolder$ + "/get-top-10-scores.php")
		while GetHTTPResponseReady(http) = 0
			print("Connecting...")
			Sync()
		endwhile
		response$ = ""
		jsonData as typeScore[]
		scores.fromJSON(GetHTTPResponse(http))			
	endif
	if (GetVirtualButtonPressed(btnDeleteID))
		if (GetEditBoxText(editBoxDeleteID) = "")
			response$ = "ID missing"
		else
			SendHTTPRequestASync(http, httpFolder$ + "/delete-score-id.php", "&id=" + GetEditBoxText(editBoxDeleteID))
			while GetHTTPResponseReady(http) = 0
				print("Connecting...")
				Sync()
			endwhile
			response$ = GetHTTPResponse(http)
			scores.length = -1
		endif		
	endif

    Sync()
loop

CloseHTTPConnection(http)
DeleteHTTPConnection(http)

function CreateButton(width# as float, height# as float, x# as float, y# as float, label$ as string)
	inc buttonCounter
	AddVirtualButton(buttonCounter, x#, y#, 0)
	SetVirtualButtonSize(buttonCounter, width#, height#)
	SetVirtualButtonText(buttonCounter, label$)
endfunction buttonCounter