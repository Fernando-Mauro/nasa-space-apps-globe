extends Node2D
var whichConvo =  0

func _ready() -> void:
	$focusChar.play("talking")
	$nonFocusChar.play("idle")


func _process(delta: float) -> void:
	pass
