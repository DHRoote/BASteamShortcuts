#SingleInstance Force

MGui := Gui()
MGui.Title = "SC"

MGui.Add("Text", "XM10 YM10 W50 Center", "1 스킬")
MGui.Add("Text", "X+10 W50 Center", "2 스킬")
MGui.Add("Text", "X+10 W50 Center", "3 스킬")

MGui.Add("Edit", "vS1 XM10 Y+5 w50 Center Limit1", "q")
MGui.Add("Edit", "vS2 X+10 w50 Center Limit1", "w")
MGui.Add("Edit", "vS3 X+10 w50 Center Limit1", "e")

MGui.Add("Text", "Xm10 Y+10 W50 Center", "오토")
MGui.Add("Text", "X+10 W50 Center", "배속")

MGui.Add("Edit", "vAuto XM10 Y+5 w50 Center Limit1", "a")
MGui.Add("Edit", "vFast X+10 w50 Center Limit1", "s")

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

	Switch ih.Input
	{
	Case MGui["S1"].value:
		Send "1"
		ih.Stop()
	Case MGui["S2"].value:
		Send "2"
		ih.Stop()
	Case MGui["S3"].value:
		Send "3"
		ih.Stop()

	Case MGui["Auto"].value:
		Send "a"
		ih.Stop()
	Case MGui["Fast"].value:
		Send "s"
		ih.Stop()

	Default:
		Send ih.Input
		ih.Stop()
	}

}

F1::
{
	ExitApp
}


