extends AnimatedSprite2D

@export var animated: AnimatedSprite2D

@export var keyToPress = "e"
@export var actionToDo = "action_main"

var keys = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","up","right","down","left","1","2","3","4","5","6","7","8","9","0"]


func _ready() -> void:
	if animated:
		animated.play("default")



func _process(_delta):
		if Input.is_action_just_pressed(actionToDo) && $".".visible:
			$".".hide()
			animated.play("nothing")
	
