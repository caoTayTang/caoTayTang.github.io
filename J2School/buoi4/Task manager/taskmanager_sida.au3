#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiListView.au3>
#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("Task Manager", 571, 357, 317, 151, BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_TABSTOP))
Global $MenuItem1 = GUICtrlCreateMenu("&File")
Global $MenuItem3 = GUICtrlCreateMenuItem("Run &new task", $MenuItem1)
Global $MenuItem2 = GUICtrlCreateMenuItem("E&xit", $MenuItem1)
GUISetFont(14, 400, 0, "Segoe UI")
Global $ListView1 = GUICtrlCreateListView("Process name|Process ID", 0, 0, 650,300)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 50)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 50)
Global $Button1 = GUICtrlCreateButton("End Task", 380, 303.5,161,30)
Global $FormMain_AccelTable[1][2] = [["!+{F9}", $MenuItem3]]
GUISetAccelerators($FormMain_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


_GUICtrlListView_SetColumnWidth($ListView1,0,350)
_GUICtrlListView_SetColumnWidth($ListView1,1,150)

loadProcess()


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $MenuItem1


		Case $MenuItem2 ; exit
			Exit

		Case $MenuItem3 ; run new task
			send("#r")

		Case $Button1 ; end task
			Local $index = _GUICtrlListView_GetSelectedIndices($ListView1)
			Local $data = _GUICtrlListView_GetItemText($ListView1,Number($index),1)
			ProcessClose($data)
			_GUICtrlListView_DeleteItem($ListView1,number($index))


	EndSwitch
WEnd


Func loadProcess()
	Global $processes = ProcessList()

	for $i = 1 to $processes[0][0]
		GUICtrlCreateListViewItem($processes[$i][0] & '|' & $processes[$i][1], $ListView1)
	next

EndFunc