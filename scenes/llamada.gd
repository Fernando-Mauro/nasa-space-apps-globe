extends Node2D
@export var whichDay =  1
@export var day = true
var focusChar:bool
func _ready() -> void:
	$focusChar.play("talking")
	$nonFocusChar.play("idle")
	dialogSequencer()
#Estructura de dialogo
# DIALOG_CALL_DAY(whichDay)_(morning\night)_(number)


func nextDialogGenerator(actDialog):
	var nextDialog:String
	nextDialog = "DIALOG_CALL_DAY"+str(whichDay)+"_"
	if day:
		nextDialog+= "MORNING"
	else:
		nextDialog += "NIGHT"
	nextDialog+= str(actDialog)
	return nextDialog

func dialogSelector(dialogKey):
	var dialogDivider = tr(dialogKey).split(":",false,1)
	focusChar = (dialogDivider[0] == "f")
	return dialogDivider[1]	



func dialogSequencer():
	var nextDialog = 1
	while (nextDialog < 10):
		print(nextDialogGenerator(nextDialog))
		nextDialog+=1
