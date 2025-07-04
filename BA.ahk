#SingleInstance Force

keys := [
    "a", "b", "c", "d", "e",
	"f", "g", "h", "i", "j",
	"k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t",
	"u", "v", "w", "x", "y",
	"z",
    "Tab", "LShift", "LCTRL",
	"Space"
]

MGui := Gui()
MGui.Title := "SC"

MGui.Add("Text", "XM10 YM10 W50 Center", "1 스킬")
MGui.Add("Text", "X+10 W50 Center", "2 스킬")
MGui.Add("Text", "X+10 W50 Center", "3 스킬")

MGui.Add("DropDownList", "vS1 XM10 Y+5 w50 Center Choose17", keys)
MGui.Add("DropDownList", "vS2 X+10 w50 Center Choose23", keys)
MGui.Add("DropDownList", "vS3 X+10 w50 Center Choose5", keys)

MGui.Add("Text", "Xm10 Y+10 W50 Center", "오토")
MGui.Add("Text", "X+10 W50 Center", "배속")


MGui.Add("DropDownList", "vAuto XM10 Y+5 w50 Center Choose1", keys)
MGui.Add("DropDownList", "vFast X+10 w50 Center Choose19", keys)

MGui.Add("DropDownList", "vPause XM10 Y+20 w70 Center Choose30", keys)
MGui.Add("Text", "X+5 YP+4 W90", "일시정지 활성화")
MGui.Add("CheckBox", "vPauseC X+10")

MGui.Show()
MGui.OnEvent("Close", GClose)
GClose(thisGUI) {
	ExitApp
}

bActive := true
ih := InputHook("L1")

while(1) {

	if !Winactive("Blue Archive") {
		Sleep(100)
	    ih.Stop()
		continue
	}

	ih.Start()
	ih.Wait(2)

	input := ih.Input

	Switch input
	{
	case "	":
		input := "Tab"
	case " ":
		input := "Space"
	}

	sendKey(input)

}

~LShift::
{
	sendKey("lshift")
}

~LCtrl::
{
	sendKey("lctrl")
}

sendKey(key) {

	Switch StrLower(key)
	{
	Case StrLower(keys[MGui["S1"].value]):
		Send "1"
		ih.Stop()
	Case StrLower(keys[MGui["S2"].value]):
		Send "2"
		ih.Stop()
	Case StrLower(keys[MGui["S3"].value]):
		Send "3"
		ih.Stop()

	Case StrLower(keys[MGui["Auto"].value]):
		Send "a"
		ih.Stop()
	Case StrLower(keys[MGui["Fast"].value]):
		Send "s"
		ih.Stop()

	Case StrLower(keys[MGui["Pause"].value]):
		if (MGui["PauseC"].value = 1) {
			Send "{Space}"
			Sleep(10)
			Send "{ESC}"
			ih.Stop()
		} else {
			Send "{Space}"
		}

	Default:
		Send ih.Input
		ih.Stop()
	}
}

F1::
{
	ExitApp
}


