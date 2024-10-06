extends Node2D
@export var whichDay =  1
@export var day = true
var focusChar:bool
func _ready() -> void:
	$focusChar.play("idle")
	$nonFocusChar.play("idle")
	#$text_box._display_letter()
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
	if dialogKey == tr(dialogKey):
		return
	var dialogDivider = tr(dialogKey).split(":",false,1)
	focusChar = (dialogDivider[0] == "f")
	
	return dialogDivider[1]	



func dialogSequencer():
	var nextDialog = 1
	
	while (true):
		
		var nextText = dialogSelector(nextDialogGenerator(nextDialog))
		
		if(nextText == null):
			break
		
		nextDialog+=1
	
