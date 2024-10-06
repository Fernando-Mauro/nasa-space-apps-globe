extends AnimatedSprite2D

@export var animated: AnimatedSprite2D

func _ready() -> void:
	if animated:
		animated.play("river_animation")
